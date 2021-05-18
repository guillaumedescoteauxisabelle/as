
source _env.sh
source _syncconf.sh $1
if [ "$1" == " " ]; then # Need an arg
	echo "usage:  $0 <modelname>"
	exit 1
fi

echo "executing"
echo rsync -aP "jgi@as:/a/model/models/$modelname/checkpoint_long" "/mnt/a/model/models/$modelname"
sleep 1
rsync -aP "jgi@as:/a/model/models/$modelname/checkpoint_long" "/mnt/a/model/models/$modelname"

