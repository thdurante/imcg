FROM ruby:2.5.1

ENV APP_HOME /imcg-app

MAINTAINER Thiago Durante <thdurante@gmail.com>

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends --fix-missing vim curl build-essential nodejs libpq-dev

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler mailcatcher
RUN bundle install

ADD . $APP_HOME
#RUN chmod +x docker/entrypoint.sh
