#!/bin/bash

# this is the function that converts the images from .jpg to .png
converte_imagem(){
	local caminho_imagem=$1
	local imagem=$(ls $caminho_imagem | awk -F. '{ print $1 }') 
	convert $imagem.jpg $imagem.png
}


#this function checks everything in the input directory, if it's a file (image) it converts, otherwise if it's a directory it will enter that directory

verifica_diretorio(){
	# changing to the directory of interest
	cd $1
	
	for arquivo in *
	do
		caminho_arquivo=$(find ~/Documents/workspace/ShellScripting/conversao_de_imagens/imagens-novos-livros -name $arquivo)
		if [ -d $caminho_arquivo ]
		then
			# if the variable 'arquivo' is a directory, it will call the function recursively, and do the process in that directory
			verifica_diretorio $caminho_arquivo
		else
			# calling the conversion fucntion
			converte_imagem $caminho_arquivo
		fi
	done
}

# using the function
verifica_diretorio ~/Documents/workspace/ShellScripting/conversao_de_imagens/imagens-novos-livros
if [ $? -eq 0 ] #just a check for errors
then
	echo 'Conversão realizada com sucesso'
else
	echo 'Houve um problema na conversão'
fi
