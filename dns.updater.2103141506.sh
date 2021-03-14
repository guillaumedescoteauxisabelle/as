#!/bin/bash


#@STCGoal update local IP on VPN each few hours so we stay online when DHCP change  things

#@STATUS : added to crontab -e :
## 0 6,9,12,15,18,21,0,3 * * 1 /a/bin/dns.updater.2103141506.sh


urlcall="https://directnic.com/dns/gateway/2ac6e31108282aaa24de43d4f45213ef76e566f563bf5649eac74c9be07dde3f/?data="
currentip="10.10.22.255"

currentip=$(ip addr | grep enp3 | awk '/inet/ { print $4 }')

echo $currentip

urlfullcall="$urlcall$currentip"


(cd /tmp;wget "$urlfullcall")


