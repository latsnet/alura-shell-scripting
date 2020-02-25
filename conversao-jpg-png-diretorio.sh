#!/bin/bash

converte_imagem() {
    CAMINHO_IMAGENS=./imagens-livros
    CAMINHO_PNG=./imagens-png

    if [ -d $CAMINHO_PNG ]
    then
        echo Apagando arquivos existentes...
        rm $CAMINHO_PNG -rf
    fi

    if [ ! -d $CAMINHO_PNG ]
    then
        echo Criando diretório de imagens...
        mkdir $CAMINHO_PNG
    fi

    for imagem in $CAMINHO_IMAGENS/*.jpg
    do
        # IMAGEM_DESTINO=$(echo $imagem | cut -d '/' -f 3 | cut -d '.' -f 1)
        # IMAGEM_DESTINO=$(echo $imagem | awk -F. '{ print $2 }' | awk -F/ '{ print $3 }')
        local IMAGEM_DESTINO=$(ls $imagem | awk -F. '{ print $2 }' | awk -F/ '{ print $3 }')
        convert $imagem $CAMINHO_PNG/$IMAGEM_DESTINO.png 
    done

}

converte_imagem 2>erros_conversao.txt

if [ $? -eq 0 ]; then
    echo "Conversão dos arquivos finalizada com sucesso."
else
    echo "Houve uma falha no processo."
fi
