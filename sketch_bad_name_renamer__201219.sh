# That all names are ok



for ff in *.jpg
        do
#		echo "renaming $ff..."
#		sleep 1

#		f="${ff//\'/\\\'}"
		f="$ff"
		#echo "f transformed=$f"
#sleep 1

         echo 	mv \"$f\" "\"$(echo "$f"  | sed "s/[\(!@#\$%^&*() àéôûöèä\']//g")\"" 
         	
		#echo ''$cmd''

        done


#        echo mv "'$f'" "'\
 #                       $(echo "'$f'"  |tr '.jpg' 'absext' | tr " " "_" | tr "st." "st_" |\
  #                      sed "s/[\(!@#\$%^&*() àéôûöèä\']//g" | tr "absext" ".jpg")'"

