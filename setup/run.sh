#!/bin/sh

if [ "$1" = "reset" ]; then
    echo "deleting old data..."
    rm -rf /data/nextcloud
    echo "Done."
elif [ ! -d /data/nextcloud ]; then
    echo "initializing nextcloud..."
    echo "Done."
else
    echo "data directory already exists, skipping initialization."
fi

# php nextcloud/occ config:system:set trusted_domains 1 --value localhost
