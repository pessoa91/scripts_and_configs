#!/bin/sh
echo $1

[[ ! -e $1 ]] && echo "file not found" && exit
[[ $# -eq 2 ]] && servername=$2 || servername="GVIM"

pdfname=$1
zathura -x "gvim --servername $servername -c \"let g:syncpdf='$pdfname'\" --remote +%{line} %{input}" $pdfname 
