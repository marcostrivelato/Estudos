#!/bin/bash

# This script checks the 10 processes that are using the most RAM on the machine, saves their name, RAM usage, time and date

processos=$(ps -e -o pid --sort=-size | head -n 11 | grep [0-9])


if [ ! -d log ]
then
	mkdir log
fi

processos_memoria(){
	for pid in $processos
	do
		nome_processo=$(ps -p $pid -o comm=)
		echo -n $(date +%F,%H:%M:%S, ) >> log/$nome_processo.log
		tamanho_processo="$(bc <<< "scale=2;$(ps -p $pid -o size | grep [0-9])/1024") MB"
		echo $tamanho_processo >> log/$nome_processo.log
	done
}



processos_memoria
if [ $? -eq 0 ]
then
	echo "Os logs foram salvos com sucesso"
else
	echo "Houve um problema ao salvar os logs"
fi

