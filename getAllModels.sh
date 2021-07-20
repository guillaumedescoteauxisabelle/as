(cd /a/model/models &> /dev/null ; for m in $(ls -d model_*) ; do if [ -e "$m/checkpoint_long/checkpoint" ] ; then echo "$m";fi ; done)
