#!/usr/bin/env bash
# -*- tab-width: 4; encoding: utf-8 -*-

## \mainpage
## \section Introduction
## The Bash Shell Function Library (GIAB) is a small Bash script that acts as a library
## for bash scripts. It provides a couple of functions that makes the lives of most
## people using shell scripts a bit easier.

## @file
## @author Guillaume D.Isabelle <jgi@jgwill.com>
## @author Ethen Weader <eweader@mentalos.com>
## @brief GIA Bash Shell Function Library
## @copyright New BSD
## @version 0.1.2
## @par URL
## https://github.com/guillaumeai/giabsfl
## @par Purpose
## The Bash Shell Function Library (GIAB) is a small Bash script that acts as a library
## for bash scripts. It provides a couple of functions that makes the lives of most
## people using shell scripts a bit easier.

# Do not edit this file. Just source it into your script
# and override the variables to change their value.

# Variables
# --------------------------------------------------------------#

## @var GIAB_VERSION
## @brief BSFL version number.
if [ "$GIAB_VERSION" == "" ]; then
	declare -rx GIAB_VERSION="0.1.0"
fi



# Groups of functions
# --------------------------------------------------------------#

## @defgroup command Command
## @defgroup astutil Ast Util
## @defgroup output Output
## @defgroup parser Parser
## @defgroup fs File and Directory
## @defgroup logdebug Log and debug
## @defgroup usage Usage
## @defgroup fun Fun
## @defgroup variable Variable
## @defgroup giafn






## @var QUIET
## @brief Enables / disables quiet mode.
## @details The quiet mode adds extra information for troubleshooting purposes.
## Value: 1 or 0.
QUIET=""


## @var DEBUG
## @brief Enables / disables the debug mode.
## @details The debug mode adds extra information for troubleshooting purposes.
## Value: 1 or 0
declare -x DEBUG="0"



if [ -e "$binroot/_env.sh" ] && [ "$BINENVLOADED" == "" ]; then 
        . $binroot/_env.sh $@
fi


## @var DIR
## @brief DIR used to ....
## @details Cur Dir
declare -r DIR=$(cd "$(dirname "$0"  &> /dev/null)" && pwd) &> /dev/null


if [ "$FNLOADED" == "" ]; then declare -r FNLOADED="1" &> /dev/null; fi


if [ "$GIABLOADED" == "" ]; then
        declare -r GIABLOADED="1" &> /dev/null
	if [ -e "$DIR/lib/giabsfl/lib/bsfl.sh" ]; then 
		source $DIR/lib/giabsfl/lib/bsfl.sh  &> /dev/null

	else 
		source $binroot/lib/giabsfl/lib/bsfl.sh  &> /dev/null
	fi 
fi




## @fn fnusage()
## @ingroup usage
## @brief Get Usage for this files functions
fnusage() {
	echo "GIASH Function Usage 
	by Guillaume Descoteaux-Isabelle, 2020-2021
	-------------------------------------------
	"
	echo " Function Usage:
	envif # load the _env.sh if exist in current dir
	echoifnoval <msg if no val> <val to test> [msg if val]
	"

	if [ "$1" == "--more" ];then 
	echo "More Aliqua enim est ut veniam in anim nulla aliqua eu. Labore et excepteur elit amet velit magna elit qui eu pariatur tempor reprehenderit. Cupidatat cupidatat quis non proident sit mollit qui deserunt mollit aliqua occaecat occaecat. Eiusmod qui nulla eiusmod ea velit reprehenderit duis voluptate."
	
	fi
}





## @fn envif()
## @ingroup variable
## @brief Load Env in cur dir if any
## @description  Veniam cupidatat aute officia veniam nostrud laborum ut sunt proident consectetur do dolore Lorem.
## @details Usefull because it check if exist.  Sit non nostrud culpa pariatur. Mollit incididunt reprehenderit exercitation Lorem in Lorem.
## @param variable Variable to operate on.
envif() {
	if [ -e "_env.sh" ];then 
	source _env.sh $@
	fi
}


d() {
 	if [ "$DEBUG" == "1" ] || [ $DEBUG == 1 ];then 
 		echo "$@"
 	fi
 }


echovar () {
	for i in $@ ; do 
		echo "$i = ${!i}"
	done
	#var_name=(${!foo@})
	#echo $var_name" = "$foo
	#foo = bar
}

dvar () {
	if [ "$DEBUG" == "1" ] || [ "$DEBUG" == "true" ]; then 
		for i in $@ ; do
			msg_debug "$i = ${!i}" || (msg_warning "$i is an invalid variable" )
        	done
	fi	
}

lvar() {
        if [ "$DEBUG" == "1" ] || [ "$DEBUG" == "true" ]; then
                for i in $@ ; do
                        log_debug "$i = ${!i}"  || (msg_warning "$i is an invalid variable" )
        	done
	fi
}

## @fn sedescaping() 
## @ingroup parser
## @brief Espace a string and sed seplace
## @param string To Espace - the replacer
## @param string keyword - the replaced
## @param string (opt) file
sedescaping() {

	local REPLACE="$1"

	local KEYWORD="$2"

	local FILE="$3"
	
	ESCAPED_REPLACE=$(printf '%s\n' "$REPLACE" | sed -e 's/[\/&]/\\&/g')
	echo "$ESCAPED_REPLACE"
	# Now you can use ESCAPED_REPLACE in the original sed statement
	if [ -e "$FILE" ] ; then 
		echo "Working on file"
		echo sed -i 's/KEYWORD/'"$ESCAPED_REPLACE"'/g' $FILE
		sed -i 's/'"$KEYWORD"'/'"$ESCAPED_REPLACE"'/g' $FILE
	else #normal replace
		echo "Regular work"
		sed "s/KEYWORD/$ESCAPED_REPLACE/g"
	fi

}

dcfile () {
	d $0
}

## @example replacetextbypath l=$(replacetextbypath "SAVEDIRBASE" "/a/lib/results/mypath" "ls SAVEDIRBASE")
replacetextbypath() {

	local lpattern="$1"
	local ltdir="$2"
	#shift
	#shift
	local lcontent="$3"
	#d "---__fn.sh::replacetextbypath --"
	#d "p:$lpattern"
	#d "ltdir:$ltdir"
	#d "lcontent: $lcontent"
	#d "--------------------------------"
	
	#prep the path for regex (escaping)
	local lregfix=$(echo "$ltdir" | sed -e 's/\//\\\//g')
	
	#create the new string replaced
	local lres=$(echo "$lcontent" | sed "s/$lpattern/$lregfix/")
	export REPLACETEXBYPATH="$lres"
	echo "$REPLACETEXBYPATH"
 }


isnotnumberexit() {
	re='^[0-9]+$'
	local showmsg="$2" 

	if ! [[ $1 =~ $re ]] ; then
		local msgtxt="error: Argument Not a number "
   		if [ "$2" != "" ] ;then 
			msgtxt="$2 ($1)"
		fi
		msg_critical "error: $msgtxt" >&2
		if [ "$2" != "" ] ;then
			msg_info "$3"
		fi
		exit 1;
	fi
}


## @fn getff()
## @ingroup fs FS
## @brief Get filename no extension
## @details getff $f; echo $FF
## @param file
## @retval 1 + export FF=filenamenoext
getff() {
	local f="$1"
	local ff="${f%.*}"
	export FF="$ff"
	echo "$FF"
	return 1
}





## @fn ecn()
## @ingroup output Output
## @brief Echo without newtline colored
## @param string [r|g|b|m|y].
## @param string Message
ecn () {
	local color="$1"
	if [ "$2" == "" ];then echo "Must specify a color and content" ; return ; fi
	shift
	local arr=("$@")
	local red=`tput setaf 1` #red var for terminal color change
	local green=`tput setaf 2` #green var for terminal color change
	local blue=`tput setaf 3` #green var for terminal color change
	local reset=`tput sgr0` #reset var for terminal color change
	local dcolor=reset
	case $color in
		red)
		dcolor=`tput setaf 1` #red
		;;
		r)
		dcolor=`tput setaf 1` #red
		;;
		green)
		dcolor=`tput setaf 2`
		;;
		g)
		dcolor=`tput setaf 2`
		;;
		yellow)
		dcolor=`tput setaf 3`
		;;
		y)
		dcolor=`tput setaf 3`
		;;
		blue)
		dcolor=`tput setaf 4`
		;;
		b)
		dcolor=`tput setaf 4`
		;;
		magenta)
		dcolor=`tput setaf 5` # Magenta
		;;
		m)
		dcolor=`tput setaf 5` # Magenta
		;;
		cyan)
		dcolor=`tput setaf 6`
		;;
		c)
		dcolor=`tput setaf 6`
		;;
		*)
		dcolor=`tput sgr0` #reset 
		;;
	esac

	echo -n "${dcolor} ${arr[@]} ${reset}"

}


## @fn ec()
## @ingroup output
## @brief Echo with newtline colored
## @param string [r|g|b|m|y].
## @param string Message
ec () {
	ecn "$@" $'\n'
	 
}


## @fn ecd()
## @ingroup output
## @brief Echo with newtline colored if DEBUG=1
## @param string [r|g|b|m|y].
## @param string Message
ecd ()
{
	
	if [ "$DEBUG" == "1" ];then 
		ec "$@" $'\n'
	fi
}

## @fn ecnd()
## @ingroup output
## @brief Echo without newtline colored if DEBUG=1
## @param string [r|g|b|m|y].
## @param string Message
ecnd ()
{
	
	if [ "$DEBUG" == "1" ];then 
		ecn "$@"
	fi
}

#Strip an input of all other args input
stripof () {
	#echo "Stripping"
	local arr=("$@")
	local src="${arr[0]}"
	#echo "src=$src"
	#shift
	#for c in "${arr[@]}"; do echo "$c" ;done
	#echo "-------"
	local r="$src"
	for a in "${arr[@]}"; do
		#echo "Testing $a  --> in: $r"
		if [ "$a" != "$src" ] && [ "$a" != "" ] && [ "$r" != "" ] ;then # we do process
			r=$(sed -e 's/'"$a"'//g'<<<$r) || echo " " &> /dev/null
			
		fi
	done
	echo "$r"
	export STRIPPEDOF="$r"
}


#@STCGoal Generate a namespace to use from a given directory composed of multiple specified levels
# make_dirns /c/tmp/mydir 2 = tmp__mydir
# make_dirns /c/tmp/mydir 2 "--" = tmp--mydir
# make_dirns /c/tmp/mydir 3 f "--" = c-tmp--mydir
# make_dirns /c/tmp/mydir 3 r "--" = mydir-tmp--c


fwd() { echo "$(pwd)/$1" ;}
#Add alias
fwp() { echo "$(pwd)/$1" ;}

## @fn mkdirns()
## @ingroup fs FS
## @brief Make nice output of folder structure
## @details Compose path /a/my/path = a__my__path
## @param string Sourcepath.
## @param int Number of levels (can be negative)
## @param string (Optional (suffix)).
mkdirns () {
	local topdir="$1"
	if [ "$1" == "." ] || [ "$1" == "" ] ; then 	topdir="$(pwd $1)" ; fi
	tbn=""
 	if [ -f "$1" ]; then #@state We have a file
		topdir=$(dirname "$1")
		if [ "$topdir" == "." ] || [ "$topdir" == "" ] ; then     topdir="$(pwd)" ; fi
		tbn=$(basename "$1")
		tbnff=${tbn%.*}
	fi

	local levelup1=2 #default
	 #clean negative val
	local separator="$3"
	#echo "2:$2, 3:$3" >> $binroot/../tst.txt
	#if (( "$2" < "0" )) ;
	local order=$(		
		if [ "$2" != "" ] && [ "$2" -lt "0" ];then echo "r";else echo "f";fi 	
			)

	#echo "levelup1=$levelup1"
	#support more levels with a second optional args
	if [ "$2" != "" ]; then 	levelup1="$2"; fi #@state we have a number of level up to do
	
	#echo "order=$order"
	#echo "BFORE:levelup1=$levelup1"

	if [ "$order" != "f" ]; 
					then 
					levelup1=$(echo $levelup1 | cut -c 2)
					#echo "ORder is NOT f"
					#else echo "ORder is f"
					fi
	#echo "AFTER:levelup1=$levelup1"

	#setup default or specified separator
	if [ "$3" == "" ]; then 
		if [ "$GIADEFAULTFILENAMESEPARATOR" == "" ]; then 
			separator="__"
		else
			separator="$GIADEFAULTFILENAMESEPARATOR"
		fi

	fi #@a we have a default separator
	


	local cdir=$(pwd)
	unset outdirns
	export outdirns=$(basename $topdir)
	if [ "$levelup1" != "0" ]; then # so we can ask for just one level (ya know myvar=$(basename $blabla) is not so fun)
		cd $topdir  || (echo "cd topdir($topdir) FAILED" && return -1)
		for i in $(seq 0 $levelup1); do
			if [ "$i" != "$levelup1" ]; then
				cd ..
				bn=$(basename $(pwd))
				#@a Which order ?
				outtmp=""
				if [ "$order" == "f" ]; 
					then 
					outtmp="$bn$separator$outdirns"				
					else 
					outtmp="$outdirns$separator$bn"
					fi
				outdirns="$outtmp"
			fi
		done 
	fi
	#Append or prepend if we ask for a file NS
	if [ "$tbn" != "" ]; then # We want a file NS
		if [ "$order" == "f" ];then
			outdirns="$outdirns$separator$tbnff"
		else
			outdirns="$tbnff$separator$outdirns" 
		fi
	fi
	cd $cdir &> /dev/null #@state Back where we are
	#@a Exporting
	unset GIAOUTDIRNS
	outdirns=$(sed -e 's/\//_/g' <<<$outdirns | sed -e 's/"/_/g') || #echo " " &> /dev/null
	# &> /dev/null)
	unset GIAOUTDIRNS
	export GIAOUTDIRNS="$outdirns"
	echo "$GIAOUTDIRNS"
	unset outdirns
}

mkdirnstrippedof () {
	
	local arr=("$@")
	#  echo "${arr[@]}"
	#  echo "0:${arr[0]}"
	#  echo "1:${arr[1]}"
	#  echo "2:${arr[2]}"

	local src="${arr[0]}"
	#echo "src=$src"
	#shift
	local levelup1="${arr[1]}"
	# echo "src=$src"
	# echo "levelup1=$levelup1"
	#shift
	#echo mkdirns "$src" $levelup1
	local stripofcharlist=""
	local max=${#arr[@]}
	max=$(expr $max - 1)
	for a in $(seq 2 $max); do 
		#echo "$a:${arr[a]},"
		stripofcharlist+="\"${arr[a]}\" "
		done
	#echo "stripofcharlist+=$stripofcharlist"
	#shift 1
	#for a in "${arr[@]}"; do echo "a:$a,"; done



	mkdirns "$src" $levelup1 &> /dev/null
	#echo "-----------------"
	#echo "$GIAOUTDIRNS"
	#echo	stripof "$GIAOUTDIRNS" $stripofcharlist
	stripof "$GIAOUTDIRNS" "$stripofcharlist"
	# echo "v=$v"
	unset GIAOUTDIRNSSTRIPPED
	#echo "$t"
	export GIAOUTDIRNSSTRIPPED="$t"
	export GIAOUTDIRNSSTRIPPED="$STRIPPEDOF"
	echo $GIAOUTDIRNSSTRIPPED
	return 1

}

lookquiet() {

	if [ "$QUIET" == "" ]; then
		#echo "QUiet is not yet set $QUIET"
		QUIET=0
		arr=("$@")
		if [ "$#" -eq 0 ]; then
			QUIET=0
			#echo "Was no args"
			
		else
			c=0
			for a in "${arr[@]}"; do
					d "-------$c:$a"
					if [ "$a" == "--quiet" ] || [ "$a" == "-q" ];then
							d "--quiet used"
							QUIET=1
							break
							
					fi
				c=$(expr $c + 1)
			done
		fi
	fi
	return $QUIET
}

echoifnoval() {
	d "1:$1,2:$2"
	if [ "$2" == "" ]; then
		echo "$1"
		RES=1
	else
		if  [ "$QUIET" == "0" ]  ; then echo -n "$3" ; fi
		RES=0
	fi
	return $RES
}

echoifnotquiet() {
	# lookquiet "$@"

	if  [ "$QUIET" == "0" ]  ; then 
		echoifnoval "$1" "DOIT" 
	fi
}

einq() {
	echoifnotquiet  "$1" "DOIT" 
}

q() {
	echoifnotquiet  "$1" "DOIT" 
}

dowork() {	
	echoifnotquiet  "$1" "DOIT" 
}

donework() {	
	echoifnotquiet "$1" "DOIT"
	exit $2
}

exitifnoval(){
	d "entering exitifnoval(){ $1 $2"
	# echoifnoval "$1" "$2"
	# d "--$RES--"
	if [ "$2" == "" ] ; then 
		echo  "$1"
		exit 
	else
		d RES was not 1
	fi
}



setappheader() {
	export appheader="------------------------------------------
-- $appname -
-- by $appauthor, $appyear
-----------------------------------------"
}


showusageexitifnoval() {
	#echo "$appheader"
	#fulltext=$appheader$appusage
	
	#if [ "$LASTREQUIREDARG" != "NONE" ] ||  [ "$LASTREQUIREDARG" == "--help" ]; then 
		echoifnoval "$appheader" $LASTREQUIREDARG
		 exitifnoval "$appusage" $LASTREQUIREDARG
	#fi

}
startapp() {
	export appname="$1"
	export appauthor="$2"
	export appyear="$3"
	export appusage="$4"
	export LASTREQUIREDARG="$5" 
	setappheader
	showusageexitifnoval
	echoifnotquiet $appheader $5
	 
}


xparam() {	
	echo 1:$1 2:$2 3:$3
}

	
grepsearcher()
{
	#echo "1:$1  2:$2"

	f=$2
	pattern="$1"

	if [ -d "${f}" ] ; then
		d "$f is a directory"
	else
		if [ -f "${f}" ]; then #echo $f is a file


			r=$(cat "$f" | grep -n "$pattern" )
			lines=$(cat "$f" | grep -n "$pattern" | tr ":" " " | awk '// { print $1 }') # Get the line number of the grepped
			readarray -t larr <<<"$lines" # Transform variable into array
			readarray -t y <<<"$r"

			if [ "$r" != "" ]; then 
				# echo -n "${red} -----   ${green} vi +$l $f ${reset}" | tr "\n" " "
				headlines="-----" 
				headlines=">" 
				cla=0
				curtxt=" "
				prevtxt="-"
				pf=" "
				for la in "${larr[@]}"; do
					#echo  "$f ${reset}" 
					red=`tput setaf 1` #red var for terminal color change
					green=`tput setaf 2` #green var for terminal color change
					reset=`tput sgr0` #reset var for terminal color change
					pl=4
					lapadded=`printf %0${pl}d $la` #pad var from a number var
					clen=${#la}
					clenm=$(expr $pl - $clen)
					

					lapspaced=$la`printf ' %.0s' $(seq 1 $clenm)` # create a padding with x nb of spaces before a string
					
						
					cout="$headlines vi +$lapspaced $f"
					coutl=${#cout} #counting char
					coutspaced=`printf ' %.0s' $(seq 1 $coutl)` #repeat a char in a line

					tw=$(tput cols)
					#echo "tput cols: $tw"
				
					txtout=$(echo "${red} $headlines ${green} vi +$lapspaced $f${reset}"  )
					
					#echo -n "$txtout" 
					#| cut -c1-$tw 2> /dev/null || echo " " &> /dev/null
					
					clr=${y[cla]} # get array val of current line
					curtxt="$clr"
					#echo "clr: $clr"
					#if [ "$clr" == "$prevtxt" ] ; then #we clean our text its the same
					#	clr=" "
					#fi

					mod=$(echo "$clr" | sed -e 's/  / /g')
					
					#mod=${mod/"\t"/" "}
					#mod=${mod/"  "/" "}
					#mod=${mod//[\t]/ }
					if [ "$pf" != "$f" ]; then #a return, we changed files
						echo " "
					fi
					pf=$f
					echo "$txtout" $'\t'"  $mod"  | cut -c1-$tw 2> /dev/null || echo " " &> /dev/null
					#| sed -r 's/[\ \ ]+/\ /g'
					#| awk '// { for v in $@; do printf $v; done }'
					#readarray -t yy <<< $(echo "  $y" | awk '/ / {  print $1')

					#
					cla=$(expr $cla + 1)
				done

				
				RES+=' '$f
			  fi

			#if [ "$RES" != "" ]; then return $RES; fi
		

				
		 else
			echo "${f} is not valid";
		# 	exit 1
		fi
	fi
}



# Group: Ast Util
# ----------------------------------------------------#



## @fn getmodellist()
## @ingroup astutil
## @brief Get model list (depend on $modelroot to be defined)
getmodellist()
{
	 for d in $(cd $modelroot;ls -d *| grep model_); do (cd $modelroot;if [ -d "$d" ];then echo $d ; fi) ; done
}


## @fn getmodelcheckpoints()
## @ingroup astutil
## @brief Get  list og available checkpoint
## @param string Modelname (15,30, 185)
getmodelcheckpoints() {
	modelname=$1
	$binroot/mckinfo.sh $modelname
}

cleanbase64string() {
	sed -e 's/data:image\/jpeg;base64,//g'<<<"$1"
}


makecheckpointfile(){


	#########################################################
	# Model Web API Checkpoint Server                       #
	# This version should receive a checkpoint number       #
	# as input to mount along with the modelname            #
	# By Guillaume Descoteaux-Isabelle, 2021 (UQAC/NAD)     #
	#########################################################

	# 

	#backup the serverhostport
	export serverhostport_=$serverhostport
	source $rwroot/_env.sh
	export serverhostport=$serverhostport_
	unset serverhostport_

	modelname=$1
	checkpointno=$2
	modelmountpath=$modelroot
	
	DEBUG=0

	# local path and container mount path : modelmountpoint modellocalpoint
	export modelmountpoint="$containermodelroot/$modelname/checkpoint_long"
	export modellocalpoint="$modelmountpath/$modelname/checkpoint_long"
	dvar modelmountpoint modellocalpoint

	####@TODO MAke the 3 model file and checkpoint specific file
	# $modelmountpath  = /a/model/models/$modelname/checkpoint_long
	# $modellocalpoint # The root where we will mount the files
	# Files :
	# .ckpt-195000.index .ckpt-195000.meta .data-00000-of-00001 model_gia-ds-fpolsonwill_v02_210424_new_195000. checkpoint
	# 3 files
	checkpointpad=$checkpointno'000'
	mindex='.ckpt-'$checkpointpad'.index'
	mmeta='.ckpt-'$checkpointpad'.meta'
	#.ckpt-195000.data-00000-of-00001
	mdata='.ckpt-'$checkpointpad'.data-00000-of-00001'
	mfilesuffix='.ckpt-'$checkpointpad
	mfilepresuffix='_'$checkpointpad

	# Content of the ./checkpoint file
	#>>model_checkpoint_path: "model_gia-ds-fpolsonwill_v02_210424_new_195000.ckpt-195000"
	#>>all_model_checkpoint_paths: "model_gia-ds-fpolsonwill_v02_210424_new_195000.ckpt-195000"
	d "Working in  $modellocalpoint"
	tmpmodelfilename=$(cd $modellocalpoint;ls *$mmeta)
	replstring='_'$checkpointpad$mmeta
	secondString=""
	tmpbasename="${tmpmodelfilename/$replstring/$secondString}"

	checkpointbasefilename=$tmpbasename
	mcheckpointfilecontentline1='model_checkpoint_path: "'$checkpointbasefilename$mfilepresuffix$mfilesuffix'"'
	mcheckpointfilecontentline2='all_model_checkpoint_paths: "'$checkpointbasefilename$mfilepresuffix$mfilesuffix'"'
	astia_server_file_location='/tmp/astiatmp'
	msg_info "Making $astia_server_file_location"
	mkdir -p $astia_server_file_location \
		&& msg_error "Created Dir: $astia_server_file_location, IS THAT WHAT FUCKS ???" \
		|| (msg_critical "creating temp failed ($astia_server_file_location)" && exit 1)
	sleep 1
	mcheckpointfilepath=$astia_server_file_location'/'$modelname'_checkpoint_'$checkpointno
	echo "mcheckpointfilepath=$mcheckpointfilepath"
	sleep 1
	mindexfile=$checkpointbasefilename$mfilepresuffix$mindex
	mmetafile=$checkpointbasefilename$mfilepresuffix$mmeta
	mdatafile=$checkpointbasefilename$mfilepresuffix$mdata

	testing=0
	if [ "$testing" == "1" ]; then

	echo "-----------------------------------------------Tests: "
	#echo "- tmpmodelfilename=$tmpmodelfilename"
	#echo "- replstring=$replstring"
	#echo "- checkpointbasefilename=$checkpointbasefilename"
	#echo "- mcheckpointfilecontent=$mcheckpointfilecontent"
	#echo "- remove : $replstring in $tmpmodelfilename and use to construct the checkpoint file"
	#echo "-- it gives: $tmpbasename"
	echo "-- So the checkpoint file content is >>"
	echo "$mcheckpointfilecontentline1"
	echo "$mcheckpointfilecontentline2"
	echo "<<"
	#echo "- checkpointbasefilename=$checkpointbasefilename"
	#echo "- mfilepresuffix=$mfilepresuffix"
	#echo "- mfilesuffix=$mfilesuffix"
	echo "- mindexfile=$mindexfile"
	echo "- mmetafile=$mmetafile"
	echo "- mdatafile=$mdatafile"
	fi
	# Making the local checkpoint we will mount
	filecontent="$mcheckpointfilecontentline1"$'\n'"$mcheckpointfilecontentline2"
	if [ -d $mcheckpointfilepath ] ; then #@bug fixing directory got created
		#ls $mcheckpointfilepath
		rmdir $mcheckpointfilepath || sudo rmdir $mcheckpointfilepath
	fi
	echo "$mcheckpointfilecontentline1" > $mcheckpointfilepath
	echo "$mcheckpointfilecontentline2" >> $mcheckpointfilepath
	# Making path to mount from local to the docker host foreach of the 3 files
	##modelmountpoint modellocalpoint
	export modelmountpointmeta=$modelmountpoint/$mmetafile
	export modelmountpointindex=$modelmountpoint/$mindexfile
	export modelmountpointdata=$modelmountpoint/$mdatafile
	export modelmountpointckfile=$modelmountpoint/checkpoint
	export modellocalpointmeta=$modellocalpoint/$mmetafile
	export modellocalpointindex=$modellocalpoint/$mindexfile
	export modellocalpointdata=$modellocalpoint/$mdatafile

	d "------------------------------------"
	d "-- File created :  cat $mcheckpointfilepath"
	export MCHECKPOINTFILEPATH=$mcheckpointfilepath
	export MCHECKPOINTCONTENT=$filecontent
	d "------------ or use : \$MCHECKPOINTFILEPATH"
	d "------------ or use : \$MCHECKPOINTCONTENT"
	DEBUG=0
}


## @fn dst()
## @ingroup giafl
## @brief Diplay status if any
dst() {
	if [ "$STATUS" ];then display_status $STATUS;fi
}

## @fn dstm()
## @ingroup giafl
## @brief Diplay status message if any
dstm() {
	if [ "$MESSAGE" ];then echo "$MESSAGE";fi
}
