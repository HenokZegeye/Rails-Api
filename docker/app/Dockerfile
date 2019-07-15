FROM ruby:2.6.1

RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs

RUN mkdir -p /opt/app
WORKDIR /opt/app


RUN gem install bundler

COPY Gemfile* /opt/app/
RUN bundle install


COPY . /opt/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
