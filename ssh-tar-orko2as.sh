tdir=$1
d=$2

if [ "$1" == "" ] || [ "$2" == "" ] ; then
	echo "usage: $0 <tdir> <subdir to copy>"

else
	 ssh jgi@orko "cd $tdir;tar cf - $d" | ssh jgi@as "cd $tdir;tar xvf -"
fi
