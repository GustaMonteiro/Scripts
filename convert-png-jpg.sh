#!/bin/bash

DIRETORIO=$1
CAMINHOS=$(find $DIRETORIO -type f -iname \*.png)

for caminho in $CAMINHOS; do
    NOME_IMAGEM=$(ls $caminho | rev | cut -d/ -f 1 | rev | cut -d. -f 1)
    DIRETORIO_IMAGEM=$(ls $caminho | rev | cut -d/ -f 2- | rev)

    convert $caminho $DIRETORIO_IMAGEM/$NOME_IMAGEM.jpg
done
