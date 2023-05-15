#!/bin/bash

cd ~/Documents/workspace/ShellScripting/apache-log

#this is a regular expression, it helps to check if the IP format is correct
# [0-9] is the group of possible characteres, and {1,3} is how many characteres
# ^ and $ are used as delimiters
regex="^([0-9]{1,3}.){3}[0-9]{1,3}$"

if [[ $1 =~ $regex ]] 
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo -e "\t O endereço IP não está presente no arquivo de log"
	fi
else
	echo "Por favor verifique o formato do input"
fi

