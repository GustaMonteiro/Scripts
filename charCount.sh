#!/bin/bash

# this script will count bytes, char, lines, and words in a file and print them out
# this script will use wc command

NUMBER_OF_BYTES="$(wc -c $1 | awk '{print $1}')"
NUMBER_OF_CHARACTERS="$(wc -m $1 | awk '{print $1}')"
NUMBER_OF_LINES="$(wc -l $1 | awk '{print $1}')"
NUMBER_OF_WORDS="$(wc -w $1 | awk '{print $1}')"

echo "Number of bytes: $NUMBER_OF_BYTES"
echo "Number of characters: $NUMBER_OF_CHARACTERS"
echo "Number of lines: $NUMBER_OF_LINES"
echo "Number of words: $NUMBER_OF_WORDS"

