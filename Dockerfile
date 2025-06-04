# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
ARG BUNDLE_PATH="/usr/local/bundle"

FROM ruby:${RUBY_VERSION}-slim AS base

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=${BUNDLE_PATH} \
    BUNDLE_WITHOUT="development test" \
    PATH="${BUNDLE_PATH}/bin:${PATH}"

# Etapa de compilación
FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libyaml-dev pkg-config freetds-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache

COPY . .

RUN bundle exec bootsnap precompile --gemfile
RUN bundle exec bootsnap precompile app/ lib/

# Imagen final
FROM base

WORKDIR /app

# Copia solo lo necesario desde la etapa build
COPY --from=build /app /app
COPY --from=build ${BUNDLE_PATH} ${BUNDLE_PATH}

# Asegura que el entrypoint tenga permisos de ejecución
RUN chmod +x /app/bin/docker-entrypoint

ENTRYPOINT ["/app/bin/docker-entrypoint"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
