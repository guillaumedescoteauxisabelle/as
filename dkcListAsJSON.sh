#!/bin/bash

docker container ps \
	--format="{\"name\":\"{{.Names}}\",\"ports\":\"{{.Ports}}\",\"image\":\"{{.Image}}\",\"status\":\"{{.Status}}\"}" \
	--all | jq --slurp
