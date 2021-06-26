#!/bin/bash
chks=$1
# Split into dir all CHKS
export basedir=chks
mkdir -p $basedir
odir=$(pwd)
for c in $chks; do tdir=$basedir/$c;mkdir -p $tdir ; cd $tdir ; cp $odir/*_$c'k.jpg' .; cd $odir; done

