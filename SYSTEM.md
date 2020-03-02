# System Install part

## Tools
```sh
apt install vim
```

## SSH
```sh
sudo apt-get install openssh-server
sudo ufw allow ssh
sudo systemctl enable ssh
sudo systemctl start ssh

```

## Firewall
```sh
# Install UFW
## Uncomplicated Firewall should be installed by default in Ubuntu 18.04, but if it is not installed on your system, you can install the package by typing:

sudo apt install ufw

sudo ufw default allow outgoing

```


# DEV

```sh
#GIT
sudo apt install git

# CMAKE
sudo apt  install cmake


```

----

# Node
```sh
sudo apt install npm -y
sudo npm install npm --g
sudo npm install ginol --g

ginol -s "test"

```

----

# Containerized Infrastructure

## Docker 
See : [SYSTEM.md](./SYSTEM.md)
[install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
```sh
sudo apt-get remove docker docker-engine docker.io containerd runc

#Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Use the following command to set up the stable repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io


# Test
sudo docker run hello-world
```
