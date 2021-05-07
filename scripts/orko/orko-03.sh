
# Composing using Docker
apt install docker-compose -y

# kubernetes
apt install kubernetes -y


#orko-05-svc-ssh-server.sh 




apt install openssh-server -y

ufw allow ssh



echo ssh-copy-id jgi@orko.guillaumeisabelle.com







#orko-04-tools.sh 

# tooling such as netstat and ip addr
apt install net-tools -y

# VIM
apt install vim -y


apt install git -y


# 
apt install dos2unix -y

#Image Magick
apt install imagemagick-6.q16hdri -y




#

#orko-07-nodejs.sh 

sudo apt update
cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
npm -v

# app install
npm i http-server gixb ginol gis-csm yarn -g


#orko-08-lamp.sh 

# If not already 
apt install docker-compose -y



cd /a
#git clone git@github.com:GuillaumeIsabelleX/docker-compose-lamp.git
cd docker-compose-lamp

# Checkout the LAMP branch
#git fetch --all
#git checkout nodalpingo origin/nodalpingo

./sh__build.sh



#orko-09-dev-dotnetcore.sh 

wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update;   sudo apt-get install -y apt-transport-https &&   sudo apt-get update &&   sudo apt-get install -y dotnet-sdk-5.0
# ref: https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu



#orko-03-svc-nvidia-docker-01.sh

### FOllowed :https://gist.github.com/nathzi1505/d2aab27ff93a3a9d82dada1336c45041

newgrp docker

# Nvidia Docker
sudo apt install curl
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# Check Docker image
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi




#orko-03-svc-nvidia-docker-02.sh 

####### Part 2 of the install #############
### goal : Container are able to run using GPUs to process AST
### Status: Current platform has compute capabilities of 3 which is not enough.
######################


# nvidia-docker

apt install nvidia-docker2 -y

# Cuda
apt install nvidia-cuda-toolkit -y




