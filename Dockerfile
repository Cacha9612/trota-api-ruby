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

FROM base

WORKDIR /app

# ✅ Solución: copia archivos sin reemplazar directorios como bin/
COPY --from=build /app/. /app/

# ✅ También asegúrate de copiar las gems instaladas
COPY --from=build ${BUNDLE_PATH} ${BUNDLE_PATH}

# ✅ Asegura que tu script de entrada sea ejecutable
RUN chmod +x /app/bin/docker-entrypoint

ENTRYPOINT ["/app/bin/docker-entrypoint"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
