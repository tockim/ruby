FROM tockim/ruby:latest

RUN apk update && apk upgrade \
    && apk add curl git make \
    libssl1.1 build-base libxml2-dev libxslt-dev libbz2 libevent-dev \
    libffi-dev glib-dev ncurses-dev readline-dev yaml-dev zlib-dev \
    libpq sqlite-dev mariadb mariadb-client mariadb-dev postgresql-dev \
    ruby-dev ruby-bundler \
    && rm -rf /var/cache/apk/*

RUN gem install --no-document bundler
