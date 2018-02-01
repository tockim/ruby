FROM tockim/ruby:latest

RUN apk update && apk upgrade \
    && apk add curl git make \
    libssl1.0 build-base libxml2-dev libxslt-dev libbz2 libevent-dev libffi-dev glib-dev ncurses-dev readline-dev yaml-dev zlib-dev \
    libpq sqlite-dev mariadb-libs mariadb-dev postgresql-dev \
    ruby-dev ruby ruby-io-console ruby-bundler ruby-irb \
    && rm -rf /var/cache/apk/*

RUN gem install --no-rdoc --no-ri bundler
