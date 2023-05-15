#!/bin/bash

#checking the server status
# --write-out or -w:	 outputs text and information after a transfer is completed. The options %{response_code} (same for %{http_code}) shows the numerical response code that was found in the last transfer.
# --output or -o:	 choses where the standart output goes, in this case we sent to /dev/null
# --silent or -s:	 silences the progres meter that shows up every time curl is invoked to transfer data
resposta=$(curl -w %{response_code} -s -o /dev/null http://localhost)


if [ $resposta -ne 200 ] #200 is the default answer when the server is online
then
	#mail is a command from mailutils, we`re sending an email to the administrator, using the settings on /etc/ssmtp/ssmtp.conf
	# -s for setting a subject/title
mail -s "Problema no servidor!" adm.email@exemple.com<<del # << is used to set a word to delimit the message on the email, i used del here. What comes in between del is the body of the e-mail
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web.
del
	#this command restarts apache server
	systemctl restart apache2
fi
