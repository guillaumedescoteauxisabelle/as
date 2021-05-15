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
echo "done Decrypting $1"
