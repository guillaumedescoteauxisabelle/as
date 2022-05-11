#!/bin/bash

. _env.sh &>/dev/null && . .env  &>/dev/null ||  . .env  &>/dev/null


#urlcsv="https://docs.google.com/spreadsheets/d/{{ID}}/gviz/tq?tqx=out:csv&sheet={{sheet_name}}"
if [ "$key" != "" ] && [ "$sheetkey" != "" ] ; then
urlcsv="https://docs.google.com/spreadsheets/d/$sheetkey/gviz/tq?tqx=out:csv&sheet=$sheetname"
curl --silent --header "Authorization: GoogleLogin auth=$key" "$urlcsv"
else
	echo "Must define key and sheetkey in .env or _env.sh"
fi



