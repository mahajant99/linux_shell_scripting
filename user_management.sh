#!/bin/bash

#sudo/root access required
if [[ "${UID}" -ne 0]]
then
		echo 'Please run with sudo or root.'
		exit 1
fi

#provide username
if [[ "${#}" -lt 1]]
then
		echo "Usage: ${0} USER_NAME [COMMENT]..."
		echo 'Create a user with name USER_NAME and comments field of COMMENT'
		exit 1
fi

#set user name
USER_NAME="${1}"
echo $USER_NAME

#extra comments
shift
COMMENT="${0}"

#create password
PASS=$(date +%s%N)

#create user
useradd -c "$COMMENT" -m $USER_NAME

#created or not
if [[$? -ne 0]]
then
		echo 'The Account could not be created"'
		exit 1
fi

#set pass
echo $PASS | passwd --stdin $USER_NAME

#created or not
if [[$? -ne 0]]
then
		echo 'Password could not be set"'
		exit 1
fi

#force pass change on first login
echo
echo "Username: $USER"
echo
echo "Password: $PASS"
echo
echo "Hostname:" $(hostname) 