#SCRIPTALIASNAME
#SCRIPTFILENAME

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        echo "Autocompletion_UNDEFINED"
        echo 'see:$binroot/etc/autocompletion/SCRIPTALIASNAME.autocomplete'
        echo "FILL_OUT_THIS_Section_in:$0:--get-completions"
        #getmodellist
        #getmodelcheckpoints $2
        exit 0
fi