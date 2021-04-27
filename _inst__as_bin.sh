#!/bin/bash
# Checkout the bin /a/bin (script specific to AS platform )

git clone git@github.com:guillaumedescoteauxisabelle/as.git bin
git fetch --all
git checkout -b bin origin/bin

