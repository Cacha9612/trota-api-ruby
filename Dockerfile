# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# 👇 Agregamos dependencias necesarias para tiny_tds
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    freetds-dev \
    libssl-dev \
    libiconv-hook-dev \
    nodejs \
    yarn \
    git \
    curl

WORKDIR /app

# 👇 Copiamos y ejecutamos bundler
COPY Gemfile* ./
RUN bundle install

# 👇 Copiamos el resto del código
COPY . .

# 👇 Instalación adicional (puede ir antes o después del COPY)
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# 👇 Variables de entorno para producción
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# ------------------------------
FROM base AS build

# 👇 Herramientas para compilar gems como tiny_tds
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libyaml-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

COPY . .
RUN bundle exec bootsnap precompile app/ lib/

# ------------------------------
FROM base

COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails
COPY --from=build /rails/bin/docker-entrypoint /rails/bin/docker-entrypoint

RUN chmod +x /rails/bin/docker-entrypoint

# 👇 Crear usuario rails
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    mkdir -p db log storage tmp && \
    chown -R rails:rails db log storage tmp

USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 80
CMD ["./bin/thrust", "./bin/rails", "server"]
