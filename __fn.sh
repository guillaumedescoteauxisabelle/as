# arr=("$@")
# for a in "${arr[@]}"; do echo "arr:$a"
# done
QUIET=""
DEBUG=""
if [ -e "$binroot/_env.sh" ]; then 
        . $binroot/_env.sh $@
fi

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

envif() {
	if [ -e "_env.sh" ];then 
	source _env.sh $@
	fi
}

#Strip an input of all other args input
stripof () {
	arr=("$@")
	src="${arr[0]}"
	#echo "src=$src"
	shift
	#for c in "${arr[@]}"; do echo "$c" ;done
	#echo "-------"
	local r="$src"
	for a in "${arr[@]}"; do
		#echo "Testing $a  --> in: $r"
		if [ "$a" != "$src" ] && [ "$a" != "" ] ;then # we do process
			r=$(sed -e 's/'"$a"'//'<<<$r)
		fi
	done
	echo "$r"

}
#@STCGoal Generate a namespace to use from a given directory composed of multiple specified levels
# make_dirns /c/tmp/mydir 2 = tmp__mydir
# make_dirns /c/tmp/mydir 2 "--" = tmp--mydir
# make_dirns /c/tmp/mydir 3 f "--" = c-tmp--mydir
# make_dirns /c/tmp/mydir 3 r "--" = mydir-tmp--c
function mkdirns () {
	local topdir="$(pwd $1)"
	local levelup1=2 #default
	 #clean negative val
	local separator="$3"

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
	if [ "$3" == "" ]; then separator="$GIADEFAULTFILENAMESEPARATOR"; fi #@a we have a default separator
	


	local cdir=$(pwd)
	
	export outdirns=$(basename $topdir)
	if [ "$levelup1" != "0" ]; then # so we can ask for just one level (ya know myvar=$(basename $blabla) is not so fun)
		cd $topdir  
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
	cd $cdir &> /dev/null #@state Back where we are
	#@a Exporting
	unset GIAOUTDIRNS
	outdirns=$(sed -e 's/\//_/' <<< $outdirns)
	# &> /dev/null)
	export GIAOUTDIRNS=$outdirns
	echo "$GIAOUTDIRNS"
	unset outdirns
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

d() {
	if [ "$DEBUG" == "1" ];then 
		echo "$1"
	fi
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
	echoifnoval "$appheader" $LASTREQUIREDARG
	exitifnoval "$appusage" $LASTREQUIREDARG
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
	#echo $1 $2
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


					txtout=$(echo "${red} $headlines ${green} vi +$lapspaced $f${reset}"  )
					echo -n $txtout
					
					clr=${y[cla]} # get array val of current line
					
					
					mod=$(echo $y | sed -e 's/  / /g')
					
					#mod=${mod/"\t"/" "}
					#mod=${mod/"  "/" "}
					#mod=${mod//[\t]/ }
					echo $'\t'"  $mod"  
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
