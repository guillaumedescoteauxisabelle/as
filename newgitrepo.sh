#!/bin/bash

cd /a/lib/git

# Make a new git repo and init it
mkdir $1.git && cd $_
pwd


git init --bare
sudo chown -R git.git .

# Init the repo
cd ../tmp
repo=$1'_repo'
mkdir $repo && cd $_
pwd

git init
echo " # $1" > README.md
git add .
git commit . -m "Initial commit"
export clonelink=git@as:/a/lib/git/$1.git
git remote add origin $clonelink
git push origin master
echo "Cleaning up"
cd ..
if [ "$repo" != "/" ]; then rm -rf $repo ; fi

echo "---------------------$1-------------------------"
echo "-----All might be fine :)"
echo "git clone $clonelink"


