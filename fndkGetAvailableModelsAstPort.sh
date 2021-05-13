#!/bin/bash


 for cp in $(source $binroot/fndkGetAvailableModels.sh); do echo $cp | tr ":" " " | awk '// { print $1 }' | cut -c 3-; done
