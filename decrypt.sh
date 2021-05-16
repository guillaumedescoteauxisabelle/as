#!/bin/bash

# --------------------------------------
# Simple File Crypting/Decrypting (SFCD)
# By Guillaume Descoteaux-Isabelle, 2021
# DECrypt using ENV Var
if [ "$sfcdk" == "" ]; then
        echo "CRYPTING ENV VAR NOT FOUND"
        echo "Please define your crypt key using such thing as .bashrc"
        echo "export sfcdk=mykey"
        echo "--------------------"
        exit 1
fi

if [ "$1" == "" ] ;then
        echo "Must specify a file to decrypt"
        exit 1
fi

echo "SFCD is Decrypting $1"
ccdecrypt -E sfcdk $1 
a=$?
if [ "$a" == "0" ]; then
echo "done Decrypting $1"
else 
 if [ "$a" == "4" ]; then echo "Crypting key does not match";exit 4 ; fi
 exit $a
fi
