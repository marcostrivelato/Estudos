#!/bin/bash

cd ~/Documents/workspace/ShellScripting/apache-log

if [ -z $1 ]
then
	while [ -z $request ]
	do
		read -p "Por favor insira um parametro (GET,PUT,POST,DELETE): " req
		request=$(echo $req | tr '[a-z]' '[A-Z]')
	done
else
	request=$(echo $1 | tr '[a-z]' '[A-Z]')
fi

case $request in
		GET)
		cat apache.log | grep GET
		;;
		
		POST)
		cat apache.log | grep POST
		;;
		
		PUT)
		cat apache.log | grep PUT	  
		;;
		
		DELETE)
		cat apache.log | grep DELETE
		;;
		
		
		*)
		echo -e "\t Essa não é uma requesição válida"
		;;
esac		
