#!/bin/bash


SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SDIR/_env.sh


sudo mkdir -p $logdir 
sudo chmod 775 $logdir ; sudo chown -R 1000.1000 $logdir ; echo "init $logdir done"
sudo mkdir -p /tmp/catter 
sudo chmod 775 /tmp/catter
sudo chown -R 1000.1000 /tmp/catter
echo "init /tmp/catter done"
sudo mkdir -p $loggia 
sudo chmod 775 $loggia 
sudo chown -R 1000.1000 $loggia 
echo "init $loggia done"


