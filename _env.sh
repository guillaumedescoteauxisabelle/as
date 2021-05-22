

## @var BINROOT
## @brief BIN Root var
BINROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# used to update the DNS
export asdnstoken="MYTOKEN"
export GIADEFAULTFILENAMESEPARATOR="__"

export logdir=/var/log/gia/net
export loggia=/var/log/gia
dnstoken="2ac6e31108282aaa24de43d4f45213ef76e566f563bf5649eac74c9be07dde3f"


############################ENDING###############
# DONT PUT THINGS ABOVE THIS

# Loads an ENV for the current host if exist
hostbinenvfile=$BINROOT'/_env_'$HOSTNAME'.sh'
#echo $hostbinenvfile
if [ -e $hostbinenvfile ]; then
    . $hostbinenvfile
else
    msg "vi $hostbinenvfile  - does not exist, create it if you require to define specific to platform variable or overwrite some." 
    #&> /dev/null 

fi


