#!/usr/bin/env bash

set -e

function rootDir()
{
    echo $(pwd)
}

function getCurrentDateTime()
{
    echo $(date +"%Y%m%d_%H%M%S")
}

function runService()
{
    echo "Running started: ${1}"
    if [[ ! -f ${1} ]]; then
        echo "File $1 not exists. Skip..."
        return;
    fi
    echo "Service: ${1}"

    source "$1"

    cd ${ROOT}
}

##
## archive To From
##
function archive()
{
    echo "tar czf $1 $2"
    mkdir -p $(dirname $1)
    tar czf $1 $2
}

##
## archiveToResults ToName From
##
function archiveToResults()
{
    echo $(archive ${ROOT}/results/$1 $2)
}

function isComposeRunning()
{
    docker-compose ps --filter status=running --services
}
