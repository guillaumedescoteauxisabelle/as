#!/bin/bash


SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SDIR/_env.sh


sudo mkdir -p $logdir
sudo mkdir -p /tmp/catter
sudo mkdir -p $loggia


