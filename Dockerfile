# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
ARG BUNDLE_PATH="/usr/local/bundle"

FROM ruby:${RUBY_VERSION}-slim AS base

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV RAILS_ENV=production \
    BUNDLE_PATH=${BUNDLE_PATH} \
    BUNDLE_WITHOUT="development test" \
    PATH="${BUNDLE_PATH}/bin:${PATH}"

FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libyaml-dev pkg-config freetds-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY Gemfile Gemfile.lock ./

# Instala las gemas y los binarios
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

COPY . .

# Precompila bootsnap y otros binarios
RUN bundle exec bootsnap precompile app/ lib/

FROM base

# Copia todo desde la fase build
COPY --from=build /app /app
COPY --from=build ${BUNDLE_PATH} ${BUNDLE_PATH}

# Copia el entrypoint
COPY --from=build /app/bin/docker-entrypoint /app/bin/docker-entrypoint
RUN chmod +x /app/bin/docker-entrypoint
ENTRYPOINT ["/app/bin/docker-entrypoint"]


# Usa Puma como server en producción (puerto 80 interno)
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
