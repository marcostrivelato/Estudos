#!/bin/bash

#checking the server status
# --write-out or -w:	 outputs text and information after a transfer is completed. The options %{response_code} (same for %{http_code}) shows the numerical response code that was found in the last transfer.
# --output or -o:	 choses where the standart output goes, in this case we sent to /dev/null
# --silent or -s:	 silences the progres meter that shows up every time curl is invoked to transfer data

resposta=$(curl -w %{response_code} -s -o /dev/null http://localhost)


if [ $resposta -eq 200 ] #200 is the default answer when the server is online
then
	echo "Está tudo bem com o servidor"
else
	echo "Reinicializando servidor ..."
	#this command restarts apache server
	systemctl restart apache2
	echo "Servidor reinicializado!"
fi
