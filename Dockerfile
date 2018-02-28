FROM tockim/base:latest

RUN apk update && apk upgrade \
    && apk add libxml2 libxslt libevent libffi glib ncurses readline \
    openssl yaml zlib curl mariadb-libs mariadb-client-libs libpq ruby ruby-io-console \
    ruby-irb ruby-bigdecimal \
    && rm -rf /var/cache/apk/*
