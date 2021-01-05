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
## archive From To
##
function archive()
{
    echo "tar czf $2 $1"
}

##
## archiveToResults From To
##
function archiveToResults()
{
    echo $(archive $1 ${ROOT}/results/$2)
}

function isComposeRunning()
{
    docker-compose ps --filter status=running --services
}
