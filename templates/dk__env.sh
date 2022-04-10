export dockertag=guillaumeai/server:db-mongo
export containername=giamongo
export dockerargsfg="-it --rm "
export dockerargsbg="-d --restart=always"
export dockermodeargs="$dockerargsfg" #default
export dockermode="bg"


# set logics
if [ "$dockermode" == "bg" ]; then export dockermodeargs="$dockerargsbg"; fi
