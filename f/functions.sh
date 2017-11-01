#!/usr/bin/env bash

function getToday {
    echo `date +%m-%d-%y`
}

function removeOldBackups {
    DATABASE=${1}
    BACKUP_DAYS=${2}

    until [ $BACKUP_DAYS -lt 1 ]; do
        DAY=`date -v-${BACKUP_DAYS}d +%m-%d-%y`
        let BACKUP_DAYS=BACKUP_DAYS-1
    done
}

function makeMongoDBBackup {
    mkdir -p ${3}
    if [[ -z ${4} ]]; then
            mongodump -h ${1} -d ${2} -o ${3}
        else
            mongodump -h ${1} -d ${2} -u ${4} -p ${5} -o ${3}
    fi

    cd ${3}

    echo "Compressing to ZIP"

    zip -r "backup.zip" .

    echo "Removing JSON and BSON Files"

    rm -rf $2

    echo "Backup has been done for the Database '${2}'"
}