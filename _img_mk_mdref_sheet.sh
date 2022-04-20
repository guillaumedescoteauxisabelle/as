if [ "$bdir" == "" ]; then echo "Please run this from the build.sh"
else
header='|  file  |  img  |'
sep='| --- | --- |'
(echo "$header";echo "$sep";for f in $(du -a img/$bdir/ | awk '/jpg/ {print $2}'); do ff=${f%.*};fff=$(echo $ff | sed -e 's/img\/'"$bdir"'\///');echo '|['$fff']('$f')|!['$fff']('$f')|' ; done) > $bdir.md

fi
