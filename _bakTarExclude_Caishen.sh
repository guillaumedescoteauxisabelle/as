
#generate a tar cmd
tfilename=Caishen.all.$(tlid).tar.gz
tfile=/tmp/$tfilename
bakdir=./Caishen
dxtdir=/Backups__2201/Caishen2202
dxfile=$dxtdir/$tfilename
export excl="";for d in ./Caishen/src/Caishen/packages ./Caishen/bin ./Caishen/binDebug ./Caishen/dist ./Caishen/releases ./Caishen/zold ./Caishen/binRelease ./Caishen/binDebug.220412.bugged-incompletebuild ./Caishen/binDebug.old.220325.tar.gz ; do excl="$excl --exclude='$d'";done;echo "tar $excl -czf $tfile $bakdir && drox upload $tfile $dxfile && ginol CAISHEN.BAK"

