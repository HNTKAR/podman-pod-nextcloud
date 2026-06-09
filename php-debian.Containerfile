# FROM docker.io/php:8.5-fpm-alpine
FROM docker.io/php:8.5-fpm

RUN apt update && apt upgrade -y && apt install -y \
    zlib1g-dev \
    libpng-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    golang-github-go-enry-go-oniguruma-dev \
    libzip-dev \
    libicu-dev \
    libsodium-dev \
    libmagick++-dev

RUN docker-php-ext-configure gd --with-freetype

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
    pcntl \
    exif \
    gmp

RUN pecl install imagick apcu redis \
    && docker-php-ext-enable imagick apcu redis

RUN groupadd -g 1101 nginx-user && \
    useradd -u 1101 -g 1101 nginx-user

WORKDIR /data

COPY ["php/config/zz-fpm-user.conf", "/usr/local/etc/php-fpm.d/zz-fpm-user.conf"]
COPY ["php/config/php.ini", "/usr/local/etc/php/php.ini"]
COPY ["php/scripts/cron.sh", "/usr/local/bin/cron.sh"]
RUN chmod +x /usr/local/bin/cron.sh
