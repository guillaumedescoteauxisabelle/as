#!/bin/bash


#SAMPLE
#make_album stylized gal2 "JG AI Prod" "Copyright Guillaume Descoteaux-Isabelle, (2021) - David B.G. (n.d.)" "Experimentation of JG AI Style on David's work"

make_album()
{

    indir="$1"
    outdir="$2"
    title="$3"
    footer="$4"
    toplevelsitename="$5"

    #echo "with exif"
    thumbsup --input $1 --output $2 \
      --thumb-size 140 \
      --small-size 380 \
      --large-size 1536 \
      --photo-quality 97 \
      --theme classic \
      --title "$title" \
      --footer "$footer" \
      --home-album-name  "$toplevelsitename" \
      --embed-exif \
      --cleanup

}

PLAN="PLAN: $0 <INPUTDIR> <OUTPUTDIR> [title] [Footer text/HTML] [Top Level Site Name] [theme] [link original] [thumsize] [small-size] [large-size] and a theme that displays creative context (inference, model, link to original, annotations )"
if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "v1: $0 INPUTDIR OUTPUTDIR v1"
	echo "v2: $0 <INPUTDIR> <OUTPUTDIR> [title] [Footer text/HTML] [Top Level Site Name]"
	echo "$PLAN"

	exit
fi

if [ "$3" == "v1" ] ; then
	# Use old function plain
	thumbsup --input $1 --output $2 && \
		echo "$2 created" || \
		echo "$2 Failed to create"
		
else	
	make_album "$1" "$2" "$3" "$4" "$5"
fi


echo "Juste pour créer de la tension structurante : $PLAN"

