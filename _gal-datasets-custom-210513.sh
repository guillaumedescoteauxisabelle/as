#!/bin/bash

vi ls.txt;ns=datasets_210513;tdir=/tmp/$ns;rm -rf $tdir;mkdir -p $tdir;for l in $(cat ls.txt); do tar cf - $l | (cd $tdir;tar xf -) ; done ; cd $tdir ; $binroot/gallery_html_maker2.sh . $wwwroot/gal/lib/$ns ; cd .. ;rm -rf $ns
