FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev nodejs \
    vim 
    
RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY config/database.yml /myapp/config/database.yml 

RUN bundle install
COPY . /myapp