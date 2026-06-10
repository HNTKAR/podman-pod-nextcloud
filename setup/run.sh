#!/bin/sh

if [ "$1" = "reset" ]; then
    echo "deleting old data..."
    rm -rf /data/nextcloud
    mariadb -u root -h $DB_HOST -p$DB_PASSWORD < /usr/local/share/deleteDB.sql
    echo "Done."
else
    echo "setting up nextcloud..."
    mariadb -u root -h $DB_HOST -p$DB_PASSWORD < /usr/local/share/createDB.sql
    su nginx-user -c "/usr/local/bin/run-php.sh"
    echo "Done."
fi
