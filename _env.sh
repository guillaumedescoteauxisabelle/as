

## @var BINROOT
## @brief BIN Root var
BINROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# used to update the DNS

export GIADEFAULTFILENAMESEPARATOR="__"

export logdir=/var/log/gia/net
export loggia=/var/log/gia



############################ENDING###############
# DONT PUT THINGS ABOVE THIS

# Loads an ENV for the current host if exist
hostbinenvfile=$BINROOT'/_env_'$HOSTNAME'.sh'
#echo $hostbinenvfile
if [ -e $hostbinenvfile ]; then
    . $hostbinenvfile
else
     echo "vi $hostbinenvfile  - does not exist, create it if you require to define specific to platform variable or overwrite some." 
    #&> /dev/null 

fi


