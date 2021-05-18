source _env.sh
source _syncconf.sh $1
if [ "$1" == " " ]; then # Need an argi
	echo "usage:  $0 <modelname>"
	exit 1
fi
rsync -aP $modelname jgi@orko:/a/model/models/
