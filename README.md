# AS/bin

* This is the /a/bin dir I am using on the prototyping/dev AI at Nad (2019-20xx)
* Git duplicate (branching an history)
* File Crypting

# Crypt-Decrypt
##feat(security):Crypting/Decrypting script

 * Crypt feature in containerized ARC"
```sh
crypt.sh myfile

decrypt.sh myfile.cpt

```

## Install
```sh
sudo apt install ccrypt -y

cd
#vi .bashrc
echo "export sfcdk=mycryptingkey" >> .bashrc
echo "alias sfc=/a/bin/crypt.sh "  >> .bash_aliases
echo "alias sfd=/a/bin/decrypt.sh "  >> .bash_aliases

```
