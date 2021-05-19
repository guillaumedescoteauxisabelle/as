#!/bin/bash


#@STCGoal update local IP on VPN each few hours so we stay online when DHCP change  things

#@STATUS : added to crontab -e :
## 0 6,9,12,15,18,21,0,3 * * 1 /a/bin/dns.updater.2103141506.sh


source /a/bin/_env.sh
asdnstoken="2ac6e31108282aaa24de43d4f45213ef76e566f563bf5649eac74c9be07dde3f"

urlcall="https://directnic.com/dns/gateway/$asdnstoken/?data="
currentip="10.10.22.255"


# inet 10.10.22.255/23 brd 10.10.23.255 scope global dynamic noprefixroute enp3s0
#currentip=$(ip addr | grep enp3 | awk '/inet/ { print $4 }')
currentip=$(ip addr | grep enp3 | sed -e 's/\// /g'| awk '/inet/ { print $2 }')


echo Current IP is : $currentip

urlfullcall="$urlcall$currentip"

logfile="/var/log/as/dns-update-$(date +"%y-%m-%d").log"
(cd /tmp;wget "$urlfullcall" > "$logfile")
chown jgi.jgi "$logfile"


