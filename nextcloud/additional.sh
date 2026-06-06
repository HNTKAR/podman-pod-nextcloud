#!/bin/sh
if [ ! -d /data/nextcloud ]; then
    mv /usr/local/share/nextcloud /data/nextcloud
    chmod -R 770 /data/nextcloud
    chown -R nginx:nginx /data/nextcloud
fi
# php data/nextcloud/occ config:system:set trusted_domains 1 --value localhost


