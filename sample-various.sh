


#@STCGoal detect if a variable is a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   msg_critical "error: Argument Not a number (checkpoints are numbers)" >&2; exit 1
fi

