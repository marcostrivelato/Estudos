#!/bin/bash

# This is an exercise - We are converting images from .jpg to .png and sending it to a new folder

converte_imagem(){
cd ~/Documents/workspace/ShellScripting/conversao_de_imagens/imagens_livros

# Verifying if exist a directory named png, if not, it`s created
if [ ! -d png ]
then
	echo Criando uma pasta
	mkdir png
fi
	

for imagem in *.jpg
do	
	# we are using awk to process the result from ls, here we are selecting everything until the caracter '.' and printing the result of it
	# Using local guarantees this variable is used only on the functions scope
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	
	# now doing the conversion
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

#Calling the function, if it has an error on it`s execution it sends the error messages to the file erros_conversao.tgx
converte_imagem 2>erros_conversao.txt

#telling the usuary whether the execution was a sucesses or fail
if [ $? -eq 0  ] 
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve uma falha na conversão"
fi
