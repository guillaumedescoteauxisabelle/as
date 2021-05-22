
varin=$1
echo \$1
#var_name=(${!1@})
var_name=(${!varin@})
echo "var_name = "$1
echo $var_name" = "${varin@}

