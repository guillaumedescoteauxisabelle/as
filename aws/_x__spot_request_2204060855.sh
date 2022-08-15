
aws ec2 request-spot-instances --spot-price "0.23" --instance-count 1 --type "one-time" --launch-specification file://$0.specification.json > $0.launch-output.json
cat $0.launch-output.json

