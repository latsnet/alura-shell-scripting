#!/bin/bash

CAMINHO_IMAGENS=~/dados/github/alura-curso-shell-scripting/imagens-novos-livros

converte_imagem() {
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorios() {
    cd $1
    for arquivo in *
    do
        local caminho_arquivo=$(find $CAMINHO_IMAGENS -name $arquivo)
        echo $caminho_arquivo
        if [ -d $arquivo ]; then
            varrer_diretorios $caminho_arquivo
        else
            converte_imagem $caminho_arquivo
        fi
    done
}

varrer_diretorios $CAMINHO_IMAGENS 2>erros.txt

if [ $? -eq 0 ]; then
    echo "Conversão realizada com sucesso"
else
    echo "Houve um erro na conversão"
fi
