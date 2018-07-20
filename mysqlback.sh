#!/bin/sh

export DATABASE=--all-databases

export BACKUP_FILE=/backups/mysql/db-backup.sql.gz

export AZ_STORE="Enter Storage Account Name"

export AZ_STORE_KEY="Enter Storage Account Key"

export AZ_STORE_CONTAINER="Enter Storage Account Container"

export BLOB=backups/mysql/db-backup-$(date +%Y%m%d).sql.gz


mysqldump -u root -p"Enter Root Password (NO SPACES between -p & password)" $DATABASE > temp.sql

gzip temp.sql

rm -rf $BACKUP_FILE

mv temp.sql.gz $BACKUP_FILE

az storage blob upload -f $BACKUP_FILE -c $AZ_STORE_CONTAINER -n $BLOB --account-name $AZ_STORE --account-key $AZ_STORE_KEY



