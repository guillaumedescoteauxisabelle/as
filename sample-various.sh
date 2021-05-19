


#@STCGoal detect if a variable is a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   msg_critical "error: Argument Not a number (checkpoints are numbers)" >&2; exit 1
fi


#@STCGoal Split on space,semi-colon,newline to create an array
y=(${TORENDER//$';'/ }) #semicolor
y=(${x//$'\n'/ }) #newline
y=(${x//$' '/ }) #space


#STCgoal ASsing a value from multiple lines
read -r -d '' VAR << EOM
This is line 1.
This is line 2.
Line 3.
EOM

