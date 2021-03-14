#!/bin/bash


#@STCGoal update local IP on VPN each few hours so we stay online when DHCP change  things

#@STATUS : added to crontab -e :
## 0 6,9,12,15,18,21,0,3 * * 1 /a/bin/dns.updater.2103141506.sh


source /a/bin/_env.sh

urlcall="https://directnic.com/dns/gateway/$asdnstoken/?data="
currentip="10.10.22.255"

currentip=$(ip addr | grep enp3 | awk '/inet/ { print $4 }')

echo Current IP is : $currentip

urlfullcall="$urlcall$currentip"


(cd /tmp;wget "$urlfullcall")


