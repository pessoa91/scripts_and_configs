#!/bin/bash

declare -i tabulators=$(< /tmp/latestLine.txt tr -dc \\t | wc -c)

#echo $tabulators

~/bin/insertLatex.sh $(cat /tmp/latestLine.txt)


while [[ $((tabulators--)) -gt 0 ]] ; do 
	sed -i "s/^/\t/" /tmp/latestInsertLatex.txt
done
