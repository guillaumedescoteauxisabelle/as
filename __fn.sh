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
			l=$(cat "$f" | grep -n $pattern | tr ":" " " | awk '// { print $1 }')
			if [ "$r" != "" ]; then 			
				red=`tput setaf 1`
				green=`tput setaf 2`
				reset=`tput sgr0`
				echo -n "${red} -----   ${green} vi +$l " | tr "\n" " "
				echo "$f ${reset}" 
				echo ">>>$r<<<"
				# echo -n "${red} -----   ${green} vi +$l $f ${reset}" | tr "\n" " "
				
					
				# 	for p in "$r"; do
				# 		echo "p:$p"
				# 		line=$(echo "$p" | tr ":" " "|awk '// { print $1 }')
				# 		echo "$p" | tr ":" " "|awk '// { print $1 }' 
				# 		#echo "$r"
						
				# 	done
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
