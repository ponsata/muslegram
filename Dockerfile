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
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

RUN bundle install
COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
