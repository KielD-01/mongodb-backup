#!/usr/bin/env bash
source ./f/functions.sh

DAYS=${1}
MONGO_HOST=${2}
DATABASES=${3}
MONGO_LOGIN=${4}
MONGO_PWD=${5}
BASE_PATH=~/backups/mongo/

if [[ $DAYS =~ ^-?[0-9]+$ ]]; then
    IFS=' ' read -ra DATABASE <<< "$DATABASES"
    TODAY=`getToday`

    for i in "${DATABASE[@]}"; do

        echo "Removing backups older than ${DAYS} day(-s) for Database ${i}"
        removeOldBackups $i $DAYS

        echo "Creating backup for Database ${i}"
        BACKUPS_DIR=$BASE_PATH$i/$TODAY/

        if [[ ${#MONGO_PWD} == "" ]]; then
            let MONGO_PWD=''
        fi

        makeMongoDBBackup $MONGO_HOST $i $MONGO_LOGIN $MONGO_PWD $BACKUPS_DIR

    done
fi