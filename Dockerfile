FROM ruby:2.3

# RUN apt-get update
# RUN apt-get install -y git

RUN mkdir /app
WORKDIR   /app

COPY ./Gemfile      /app
COPY ./Gemfile.lock /app

ENV BUNDLE_PATH /tmp/bundle

RUN bundle

ENV RACK_ENV production
ENV DOCKER   1

COPY . /app


EXPOSE 3000

CMD ./run
# bundle exec rackup -p 3000 -o 0.0.0.0
