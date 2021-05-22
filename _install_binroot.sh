#!/bin/bash


SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SDIR/_env.sh


sudo mkdir -p $logdir 
sudo chmod 775 $logdir ; sudo chown -R 1000.1000 $logdir ; echo "init $logdir done"
sudo mkdir -p /tmp/catter 
sudo chmod 775 /tmp/catter
sudo chown -R 1000.1000 /tmp/catter
echo "init /tmp/catter done"
sudo mkdir -p $loggia 
sudo chmod 775 $loggia 
sudo chown -R 1000.1000 $loggia 
echo "init $loggia done"

#Init ability to use cron with current user
cuser=$(whoami)
if [ -e /etc/cron.allow ] ; then
	bypass="1"
	for u in $(sudo cat /etc/cron.allow) ; do
		if [ "$u" == "$cuser" ] ; then #already init
			bypass="0"
		fi
	done
			
	if [ "$bypass" == "1" ] ; then 
		echo "Initializing crontab -e for user $cuser"
		sudo touch /etc/cron.allow
		echo  "$cuser"  > /tmp/cuser.txt
		sudo cat /tmp/cuser.txt | sudo tee -a /etc/cron.allow  &> /dev/null
	fi
else 
	echo "Initializing crontag -e for user $cuser"
	sudo echo "$cuser"  | sudo tee -a /etc/cron.allow  &> /dev/null
fi	
