#!/bin/bash

declare -i tabulators=$(< ~/.vim/latestLine.txt tr -dc \\t | wc -c)

#echo $tabulators

~/bin/insertLatex.sh $(cat ~/.vim/latestLine.txt)


while [[ $((tabulators--)) -gt 0 ]] ; do 
	sed -i "s/^/\t/" ~/.cache/latestInsertLatex.txt
done
