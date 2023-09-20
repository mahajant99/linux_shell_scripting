#!/bin/bash

free_space = $(free -mt | grep "Total" | awk '{print $4}')
threshold=500

if [[$free_space -lt $threshold]]
then
		echo "Warning, RAM is running low"
else
		echo "RAM Space is sufficient. - $free_space"
fi