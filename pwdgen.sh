#!/bin/sh

## This script uses /dev/urandom to generate passwords with a minimum length of 8.

pwdlen=0
if [ $# -eq 0 ]
then
    echo "How long should the password be?"
    read pwdlen
else
    pwdlen=$1
fi

if [ $pwdlen -lt 8 ]
then
    pwdlen=8
fi

cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | fold -w $pwdlen | head -n 4 | grep -i '[!@#$%^&*()_+{}|:<>?=]'
