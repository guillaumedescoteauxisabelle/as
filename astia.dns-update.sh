#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cdir=$(pwd)

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
        else
                echo "$SDIR loading __fn"
                echo source $SDIR/__fn.sh
                source $SDIR/__fn.sh
fi

source $SDIR/_env.sh

source $HOME/.bash_env_$HOSTNAME &> /dev/null || source /home/jgi/.bash_env_$HOSTNAME &> /dev/null


#apiastiatoken=74e9be959e282c5c5744bf8cf8be1b5e9e464a7b783612bf2b02ac6dfdc219f5
#svrastiatoken=eb9cfd71ebffa0ddc8e187642bc4ff71cb94717ba56ab5fe874d12259c594acb
$SDIR/directnic-update-dns.sh $apiastiatoken
$SDIR/directnic-update-dns.sh $svrastiatoken
$SDIR/directnic-update-dns.sh $etchaitoken




