#!/bin/sh
if [ ! -d /data/nextcloud ]; then
    mv /usr/local/share/nextcloud /data/nextcloud
    chmod -R 770 /data/nextcloud
    chown -R nginx:nginx /data/nextcloud
fi
