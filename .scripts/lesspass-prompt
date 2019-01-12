#!/bin/bash

TYPETIMEOUT=3

read -p "Site: " SITE
read -p "Login: " LOGIN
printf "Password: "
OUTPASSWD="$(lpcli "$SITE" "$LOGIN" --print | sed -n 3p)"
while [[ ${TYPETIMEOUT} -gt 0 ]]; do
	printf "$TYPETIMEOUT"
	sleep 1
	TYPETIMEOUT=$(($TYPETIMEOUT - 1))
done
printf "...Typing!\n"
xdotool type "$OUTPASSWD"

unset OUTPASSWD
unset SITE
unset LOGIN
