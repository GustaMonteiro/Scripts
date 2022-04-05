#!/bin/bash

DIRETORIO=$1
ARQUIVO=/tmp/paths

find $DIRETORIO -type f -iname \*.png > $ARQUIVO

while read caminho; do
    NOME_IMAGEM=$(ls $caminho | rev | cut -d/ -f 1 | rev | cut -d. -f 1)
    DIRETORIO_IMAGEM=$(ls $caminho | rev | cut -d/ -f 2- | rev)

    convert $caminho $DIRETORIO_IMAGEM/$NOME_IMAGEM.jpg
done < $ARQUIVO
