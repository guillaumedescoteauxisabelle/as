#!/bin/bash

exiftool $1  | awk '/GPS L/ { print $1"  "$2"  "$3" "$4" "$5" "$6" "$7" "$8" "$9}'
