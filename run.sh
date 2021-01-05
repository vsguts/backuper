#!/usr/bin/env bash

source scripts/functions.sh

ROOT=$(rootDir)
DATE=$(getCurrentDateTime)

if [[ "$1" != "" ]]
then
    SERVICE=services/${1}.sh
    runService ${SERVICE}
else
    for file in services/*.sh
    do
        runService ${file}
    done
fi

echo 'ALL DONE'
