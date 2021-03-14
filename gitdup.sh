#!/bin/bash
##@Gisted: https://gist.github.com/jgwill/c9ea536f4779bdbf108c913359e9fb2a

dupsrc=$1
newname=$2
branchname="dup-$dupsrc-$newname"

git checkout -b $branchname

git mv "$dupsrc" "$newname"
git commit . -m "dup:mv $dupsrc $newname"

git checkout HEAD~ "$dupsrc"
git commit . -m "restore:$dupsrc"

git checkout -

git merge --no-ff $branchname



