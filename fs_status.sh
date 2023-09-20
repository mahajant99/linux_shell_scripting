#!/bin/bash

free_space = $(df -H | egrep -v "Filesystem|tmpfs" | grep "sda1" | awk '{print $5}' | tr -d %) 
threshold=500

if [[$free_space -ge 80]]
then
		echo "Warning, disk space is low"
else
		echo "You have sufficient memory"
fi