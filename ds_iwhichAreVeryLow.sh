#!/bin/bash

getImgRes=$binroot/imgGetResolution.sh;for f in *.jpg ; do rx=$($getImgRes $f x);if [ $rx -lt 550 ] ; then echo "ne $f" ; fi ; done

