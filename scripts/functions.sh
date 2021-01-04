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
