FROM ruby:2.3.2-alpine as builder

RUN apk --update add --virtual build-dependencies \
    build-base \
    curl-dev \
    mysql-dev \
    linux-headers

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS=4
RUN bundle install
RUN apk del build-dependencies

FROM ruby:2.3.2-alpine
ENV LANG ja_JP.UTF-8
COPY --from=builder /usr/local/bundle /usr/local/bundle

RUN apk --update add \
    bash \
    mysql-dev \
    nodejs \
    mariadb-dev \
    tzdata \
    && rm /usr/lib/libmysqld*

RUN apk del openssl-dev mariadb-client-libs mariadb-common

COPY scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
