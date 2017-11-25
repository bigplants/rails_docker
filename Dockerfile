FROM ruby:2.3.2-alpine

ENV LANG ja_JP.UTF-8

RUN apk --update add \
    build-base \
    curl-dev \
    linux-headers \
    bash \
    nodejs \
    mariadb-dev \
    tzdata \
    && rm /usr/lib/libmysqld*

##### Rails #####
RUN gem install bundler

COPY scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS=4
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
