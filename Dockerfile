FROM nginx-common:latest

RUN apk upgrade && apk add --no-cache zip
ADD https://download.nextcloud.com/server/releases/latest.zip /opt/
COPY ["config/*.conf", "/usr/local/lib/conf/"]

WORKDIR /opt
RUN unzip latest.zip && \
    mv nextcloud /usr/local/share/nextcloud && \
    rm latest.zip

RUN rm -rf /usr/local/lib/conf/default.conf
