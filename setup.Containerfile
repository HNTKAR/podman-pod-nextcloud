FROM docker.io/php:8.4-alpine

RUN apk add --no-cache \
    mariadb-client

COPY ["setup/run.sh", "/usr/local/bin/"]
RUN chmod +x /usr/local/bin/run.sh

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/run.sh"]
