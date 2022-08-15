#!/bin/bash

#@STCGoal 

if [ -e $binroot/__fn.sh ]; then source $binroot/__fn.sh ; fi

envif
#exitifnoval "Usage $0 <> " $1

echo "$weAreIn" 
(cd;git status > $giavarlog/$(whoami).gitstatus;git add .bash_his* ; git commit . -m "update(bash):$(whoami)" &&  git push )  &




