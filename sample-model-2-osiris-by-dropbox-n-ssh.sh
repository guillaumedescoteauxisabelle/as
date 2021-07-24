 cdm &> /dev/null
 dxdir=/model/models/ink_v01
 drox mkdir $dxdir &> /dev/null && echo "Created $dxdir"
 m=model_gia-ds-Inktobers-v01-210611-864x_new
 chks="465 360 315 495"
 
 for i in $chks ; do cd $m;$binroot/mcksplit.sh $i;cd ..;mt=$m-$i'ik';tar cf $mt.tar $mt && droxul upload $mt.tar $dxdir && rm $mt.tar;((ssh jgi@osiris.astia.xyz '(bash -c "cd /a/model/models;drox download '$dxdir/$mt.tar' && tar xf '$mt'.tar && rm '$mt'.tar")&')&);done
