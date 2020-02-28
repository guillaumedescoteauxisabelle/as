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


## DEV

```sh
sudo apt install git

```