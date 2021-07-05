m=model_gia-ds-DavidBouchardGagnon-v02-210702-864x_new

rhn=jgi@orko #rendering host (where to sync)
thn=jgi@as #training host

rh=$(ssh $rhn "cd /a/bin;./mckinfo.sh $m");th=$(ssh $thn "cd /a/bin;./mckinfo.sh $m");for t in $rh; do th=$(sed -e 's/'"$t "'//g'<<< $th) ;done; echo "$th"
