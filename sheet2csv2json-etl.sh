#!/bin/bash

#@STCGoal Extract data we need and transform/load as required
bdir=ds
tdir=$(pwd)/$bdir
mkdir -p $tdir
fn=main.csv
fnjson=main.json
dsfileout="$tdir/$fn"
dsfileoutjson="$tdir/$fnjson"
$binroot/sheet2csv-etl.sh > $dsfileout && \
	csv2json $dsfileout $dsfileoutjson && \
	 echo "DS CSV Downloaded to : $bdir/$fn $fnjson" || echo "Somthing failed"

