FROM ruby:2.2.6

RUN mkdir -p /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /usr/src/app

COPY . /usr/src/app

EXPOSE 3005

CMD ["rails","s","-p","3005","-b","0.0.0.0"]
