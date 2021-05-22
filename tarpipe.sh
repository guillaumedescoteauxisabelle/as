#!/bin/bash

cd $1
shift
tar cf - "$@"

