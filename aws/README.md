# --@STCGoal One Command to Run, Set DNS for AST

* An Elastic ip is created

```sh
#astia.jgwill.com
export directnic_dns_token="5233cefefab4e05776216888245af07dc34a20b2597a5b6c2ac5e4c9cbbd864b"
export t_ip="127.0.0.1"
export directnic_dns_update_base="https://directnic.com/dns/gateway/$directnic_dns_token/?data=$t_ip"

```

## Functions
```sh
# __awsfn.sh
## VARS
sessionenv=.astipsession
export awscmdallocateip="aws ec2 allocate-address"
export awscmdreleaseip="aws ec2 release-address --allocation-id "

allocateip() {
    $awscmdallocateip
}

releaseip() {
    local _allocationid=$1
    $awscmdreleaseip $_allocationid
}

assignip() {
    #TODO
}
```


```sh
source __awsfn.sh

cat sample.json | json2bash . $sessionenv -l #generate the bash env
allocateip | json2bash . $sessionenv -l #generate the bash env
. $sessionenv #source generated env
echo "Public IP is : $publicip"
###-----
```

## --@STCGoal Ending session
```sh
. $sessionenv #source generated env
#release ip
$awscmdreleaseip
```

## Install

```sh
sudo apt install awscli -y
sudo npm install json2bash --g
```
### Prereq

* nodejs
* unix
