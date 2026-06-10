FROM docker.io/php:8.4-alpine

ENV DB_HOST=db
ENV DB_PASSWORD=PASSWORD

RUN apk add --no-cache \
    mariadb-client \
    zlib-dev \
    libpng-dev \
    freetype-dev \
    libzip-dev \
    autoconf \
    gcc \
    g++ \
    make \
    sudo

RUN docker-php-ext-configure gd --with-freetype && \
    docker-php-ext-install -j8 \
        gd \
        zip \
        pdo_mysql
RUN pecl install apcu redis \
    && docker-php-ext-enable apcu redis

COPY ["setup/run.sh", "setup/run-php.sh", "/usr/local/bin/"]
COPY ["setup/*.sql", "/usr/local/share/"]
RUN chmod +x /usr/local/bin/run.sh /usr/local/bin/run-php.sh

RUN addgroup -g 1101 nginx-user && \
    adduser -D -G nginx-user -u 1101 nginx-user

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/run.sh"]
