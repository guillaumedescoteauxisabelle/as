#extract from bunch by K and store them in a target folder name using the ik(m)

 k=210k;for f in $(ls *$k*$k*) ; do d=../../compo_dbg_v01b/comp-$k-$k;mkdir -p $d ; cp $f $d ; done

