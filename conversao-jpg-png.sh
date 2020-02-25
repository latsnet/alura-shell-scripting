#!/bin/bash

CAMINHO_IMAGENS=./imagens-livros
CAMINHO_PNG=./imagens-png

for imagem in $@
do
    convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_PNG/$imagem.png
done