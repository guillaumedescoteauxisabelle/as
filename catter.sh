#!/bin/bash
#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi
DEBUG=1

#cat - >>$1
contentImage=$(cat -) && \
echo "{\"contentImage\": \"$contentImage\"}" > $1 && \
echo "done" || echo "FAILED"
ecd m "We have a request file with encoded"

