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
git clone https://github.com/GuillaumeAI/rwml__adaptive_style_transfer.git


# Other install might be relevant from root@orko
## Album maker
#...

# Model to copy.
## DBG
models="model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-135ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-90ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-150ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-120ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-210ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-225ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-60ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-315ik \
	model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-45ik" 
tdrox=/model/models/dbg
modelroot=/a/model/models

## TAR AND UPLOAD
cd $modelroot
for m in $models;do  echo "$m" ;tar cf /tmp/$m.tar $m && droxul upload /tmp/$m.tar $tdrox && rm /tmp/$m.tar && echo "drox download $tdrox/$m.tar" || echo "FAILED $m" ; done

## TO DOWNLOAD AND UNTAR

mkdir -p $modelroot ; cd $modelroot
for m in $models;do  echo "$m" ;droxul download $tdrox/$m.tar /tmp/$m.tar && tar -xf /tmp/$m.tar && rm /tmp/$m.tar && echo "installed $m" || echo "Failed to install $m" ; done


tdrox=/model/models/pt
models="model_gia-ds-pierret_ds_210512-864-v02-210527-864_new-150ik \
	model_gia-ds-pierret_ds_210512-864-v02-210527-864_new-270ik"


tdrox=/model/models/pik
models="model_gia-young-picasso-v02b-201210-864_new-120ik \
	model_gia-young-picasso-v02b-201210-864_new-375ik \
	model_gia-young-picasso-v02b-201210-864_new-15ik"




