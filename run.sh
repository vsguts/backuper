#!/usr/bin/env bash

source scripts/functions.sh

ROOT=$(rootDir)
DATE=$(getCurrentDateTime)

for file in services/*.sh
do
    echo "Service: ${file}"

    source "$file"

    cd ${ROOT}
done
