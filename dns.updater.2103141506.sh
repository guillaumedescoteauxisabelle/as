#!/bin/bash


#@STCGoal update local IP on VPN each few hours so we stay online when DHCP change  things

#@STATUS : added to crontab -e :
## 0 6,9,12,15,18,21,0,3 * * 1 /a/bin/dns.updater.2103141506.sh

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cdir=$(pwd)

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
	else 
		echo "$SDIR loading __fn"
		echo source $SDIR/__fn.sh
		source $SDIR/__fn.sh
fi

source $SDIR/_env.sh

LOG_FILE="$logdir/dns-update-$(date +"%y-%m").log"
LOG_ENABLED=y


mkdir -p $logdir || (echo "Logdir ($logdir) could not be created " && exit 1)




#asdnstoken="2ac6e31108282aaa24de43d4f45213ef76e566f563bf5649eac74c9be07dde3f"

urlcall="https://directnic.com/dns/gateway/$dnstoken/?data="
log_debug "$urlcall"
currentip="10.10.22.255"


# inet 10.10.22.255/23 brd 10.10.23.255 scope global dynamic noprefixroute enp3s0
#currentip=$(ip addr | grep enp3 | awk '/inet/ { print $4 }')
currentip=$(ip addr | grep enp3 | sed -e 's/\// /g'| awk '/inet/ { print $2 }')


msg_info "Current IP is : $currentip"

urlfullcall="$urlcall$currentip"
msg_debug "$urlfullcall"


#(cd /tmp;wget "$urlfullcall" > "$logfile")
log_info $"(cd /tmp;wget "$urlfullcall")" && msg_success "IP updated to $currentip" || msg_failed "IP Failed to update to $currentip"
#> "$logfile")

chown 1000.1000 "$logfile" &> /dev/null


