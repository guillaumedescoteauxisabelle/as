#!/bin/bash

#@STCGoal a server ready for creating
mkdir -p -m 777 /a 
git clone git@github.com:guillaumedescoteauxisabelle/as.git /a/bin
cd /a/bin
git fetch --all
git checkout -b bin origin/bin

#rw
cd /a
mkdir -p src ; cd src
git clone git@github.com:GuillaumeAI/rwml__adaptive_style_transfer.git


#ast
cd /a
git clone git@github.com:GuillaumeIsabelleX/gix-adaptive-style-transfer.git


