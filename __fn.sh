
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
	if [ -e "_env.sh" ];then source _env.sh; fi
}

echoifnoval(){

	if [ "$2" == "" ] ; then
		echo "$1"
		return 1
	else
		return 0
	fi
}


exitifnoval(){
	RES=$(echoifnoval() $1 $2)
	if [ $RES == 1 ] ; then 
		echo $3
		exit $4
	fi
}

xparam() {	
	echo 1:$1 2:$2 3:$3
}

	
