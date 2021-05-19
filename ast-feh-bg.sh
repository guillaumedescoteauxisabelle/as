pattern="jgi__SC__2104"
pattern="$1"
mport=97
exec=gia-ast
fullscreenviewer="feh -F"
astsuffix="__stylized__"
for f in $pattern* ; do 
  $exec $f $mport; ff=${f%.*}
  #view full screen
  $fullscreenviewer $ff$astsuffix$mport'.jpg' &
done