FROM docker.io/php:8.5-rc-fpm-alpine3.22

RUN apk upgrade && apk add --no-cache \
    curl-dev \
    libxml2-dev \
    lexbor-dev \
    libpng-dev \
    oniguruma-dev \
    libzip-dev \
    icu-dev \
    libsodium-dev


RUN docker-php-ext-install -j8 \
    ctype \
    curl \
    fileinfo \
    filter \
    gd \
    xml \
    mbstring \
    zip \
    posix \
    session \
    pdo_mysql \
    intl \
    sodium \
    sysvsem \
    pcntl

RUN addgroup -g 101 php && \
    adduser -D -G php -u 101 php

WORKDIR /

COPY ["php/config/zz-fpm-user.conf", "/usr/local/etc/php-fpm.d/zz-fpm-user.conf"]
COPY ["php/config/php.ini", "/usr/local/etc/php/php.ini"]
