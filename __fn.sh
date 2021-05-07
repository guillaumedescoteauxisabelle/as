# arr=("$@")
# for a in "${arr[@]}"; do echo "arr:$a"
# done
QUIET=""
DEBUG=""
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
d() {
	if [ "$DEBUG" == "1" ];then 
		echo "$1"
	fi
}
envif() {
	if [ -e "_env.sh" ];then source _env.sh; fi
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
	lookquiet "$@"

	if  [ "$QUIET" == "0" ]  ; then 
		echoifnoval "$1" "$2" 
	fi
}
einq() {
	echoifnotquiet  "$1" "$2" 
}

dowork() {	
	echoifnotquiet "$2" "$1"	
}

donework() {	
	echoifnotquiet "$2" "$1"
	exit $3
}
exitifnoval(){
	d "entering exitifnoval(){ $1 $2"
	echoifnoval "$1" "$2"
	d "--$RES--"
	if [ "$RES" == "1" ] ; then 
		echo $3
		exit $4
	else
		d RES was not 1
	fi
}


startapp() {
	export appname="$1"
	export appauthor="$2"
	export appyear="$3"
	export appusage="$4"
	echoifnotquiet "------------------------------------------
-- $appname -
-- by $appauthor, $appyear
-----------------------------------------" $5

}


xparam() {	
	echo 1:$1 2:$2 3:$3
}

	
grepsearcher()
{
	#echo $1 $2
	f=$2
	pattern=$1

	if [ -d "${f}" ] ; then
		d "$f is a directory"
	else
		if [ -f "${f}" ]; then

			#echo $f is a file
			#pwd
			r=$(cat "$f" | grep -n $pattern )
			lines=$(cat "$f" | grep -n $pattern | tr ":" " " | awk '// { print $1 }')
			readarray -t larr <<<"$lines"
			readarray -t y <<<"$r"

			if [ "$r" != "" ]; then 			
				# echo -n "${red} -----   ${green} vi +$l $f ${reset}" | tr "\n" " "
					headlines="-----" 
				cla=0
				for la in "${larr[@]}"; do
					#echo  "$f ${reset}" 
					red=`tput setaf 1`
					green=`tput setaf 2`
					reset=`tput sgr0`
					pl=4
					lapadded=`printf %0${pl}d $la`
					clen=${#la}
					clenm=$(expr $pl - $clen)
					#echo $clenm
					lapspaced=$la`printf 'p%.0s' 1 ${clenm}`
					lapspaced=$la`printf ' %.0s' $(seq 1 $clenm)`
					echo -n $lapadded	
					echo "${red} $headlines ${green} vi +$lapspaced $f${reset}" | tr "$rpl" " " | tr "$rpl2" " "


					#
					cla=$(expr $cla + 1)
				done

				cl="0"
				for l in $lines; do
					#echo $cl
					red=`tput setaf 1`
					green=`tput setaf 2`
					reset=`tput sgr0`
					echocmd="echo "
					echocmd2="echo "
					rpl=" "
					rpl2=" "
					#if [ "$cl" != "0" ]; then echocmd2="echo "; headlines=" ; ";rpl="\n" ;rpl2="\r";fi
					# $echocmd "${red} $headlines ${green} vi +$l " | tr "$rpl" " " | tr "$rpl2" " "
					# $echocmd2  "$f ${reset}" | tr "$rpl" " " | tr "$rpl2" " "
					
					
					#echo -n "${red} $headlines ${green} vi +$l " | tr "$rpl" " " | tr "$rpl2" " "
					#echo  "$f ${reset}" | tr "$rpl" " " | tr "$rpl2" " "
					
					#echo "------hl:$headlines ########echocmd1:$echocmd, echocmd2:$echocmd2##"
					#echo "-----l:$l----------------"
					#echo "-----r:$r----------------"
					#echo '>>>'$''$r'<<<'
					cl=$(expr $cl + 1)
				
				done
				#echo $'\n'"Y:$y"
				# 	#if [ "$RES" == "" ]; then RES=" "; fi
				# fi
				RES+=' '$f
			  fi

			#if [ "$RES" != "" ]; then return $RES; fi
		

				
		 else
			echo "${f} is not valid";
		# 	exit 1
		fi
	fi
}
