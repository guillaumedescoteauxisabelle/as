# AS - A Linux System Platform for research-creation in AI


## INSTALL
* After some tryout, I was able to install it using

```sh


# NVidia repo and driver install
add-apt-repository ppa:graphics-drivers
apt install nvidia-driver-440/bionic

startx

```



## Houdini

```sh

cd ~/Downloads/

tar xzf houdini-py3-18.0.393-linux_x86_64_gcc6.3.tar.gz
cd houdini-py3-18.0.393-linux_x86_64_gcc6.3
sudo ./houdini.install
# 3
# f

```

## Nuke
```sh
tar xzf Nuke-12.1v1-linux-x86-64-installer.tgz 
sudo mkdir /opt/nuke
sudo mv Nuke-12.1v1-linux-x86-64-installer.run /opt/nuke/
cd /opt/nuke/
sudo ./Nuke-12.1v1-linux-x86-64-installer.run 
sudo rm Nuke-12.1v1-linux-x86-64-installer.run
cd /opt/nuke/Nuke12.1v1
sudo ./Nuke12.1 
# Install license :   1001@licenseserver
# then quit

```

## Machine Learning/AI Framework

See : [AI.md](./AI.md)
### Python
See : [AI.md](./AI.md)
### TensorFlow
See : [AI.md](./AI.md)


## Docker - Containerized Infrastructure
```sh

```