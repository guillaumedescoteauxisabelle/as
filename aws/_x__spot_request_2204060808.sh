#!/bin/bash
. _env.sh

#instancetype="m5d.8xlarge"
# --spot-price
spotprice=1.2
#m5d.8xlarge vcpu=32, mb=128gb, storage EBS
instancetype="t2.xlarge"
spotprice="0.3"
#SMALL Host to test

launchspec="$0.specification.json"


cmd="aws ec2 request-spot-instances \
  --instance-count 1 \
  --launch-group $securitygroupid \
  --spot-price \"$spotprice\" \
  --type one-time \
  --launch-specification file://$launchspec \
   --generate-cli-skeleton"

#echo "$cmd"
echo "Command was modified to: "
echo "aws ec2 request-spot-instances --spot-price \"0.03\" --instance-count 1 --type \"one-time\" --launch-specification file://_x__spot_request_2204060808.sh.specification.json"
sleep 1
#$cmd