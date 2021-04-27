#!/bin/bash

# Crypt using ENV Var
# --------------------------------------
# Simple File Crypting/Decrypting (SFCD)
# By Guillaume Descoteaux-Isabelle, 2021

if [ "$k" == "" ]; then
	echo "# --------------------------------------
# Simple File Crypting/Decrypting (SFCD)
# By Guillaume Descoteaux-Isabelle, 2021
"
	echo "CRYPTING ENV VAR NOT FOUND"
	echo "Please define your crypt key using such thing as .bashrc"
	echo "export sfcdk=mykey"
	echo "--------------------"
	exit 1
fi
if [ "$1" == "" ] ;then
	echo "Must specify a file to crypt"
	exit 1
fi
echo "SFCD is Crypting $1"
ccrypt -E sfcdk $1
echo "done Crypting $1"
