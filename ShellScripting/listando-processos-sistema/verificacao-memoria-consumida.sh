#!/bin/bash

#Checking the amount of used memory
ratio=$(free | grep -i mem | awk '{ x=$2; y=$3; printf "%d", (y/x)*100}')

if [ $ratio -ge 60 ] #setting the RAM usage limit as 60%
then
#mail is a command from mailutils, we`re sending an email to the administrator, using the settings on /etc/ssmtp/ssmtp.conf
mail -s "Memoria em nível crítico" adm.email@exemple.com<<del #body of the e-mail, we are sending a message with the amount of used memory
O servidor está com o consumo de memória acima do limite crítico. Atulmente o consumo é de $(free -h | grep -i mem | awk '{print $3}')
del
fi
