
# Reserve IP
echo "$public_ip"

# Update DNS
curl ***  http:***$public_ip

# Wait DNS a bit
echo "Waiting for the hosting to setup..."
sleep 60

# Launch Host
echo "Launching Host"
export launch_id
## Assign IP
assignip() $launch_id

# SSH Init and reboot
sshkeyfile="~/gaia2_2101080136.pem"
remote_install_script=".bash_install"
ssh -i $sshkeyfile ubuntu@$public_ip "$remote_install_script" && \
echo "Styliser has just installed, it reboot and the we are good to go"



