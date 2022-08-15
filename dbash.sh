#!/bin/bash

# Docker bash into a container
containername=$1
docker exec -it $containername bash

