#!/bin/bash
set -e

logfile="$1"
PDF_LATEX="$2"
BIBTEX="$3"

i=1
cont=true

if grep -q 'Citation .* undefined' $logfile ; then
		eval $BIBTEX
		eval $PDF_LATEX
		((i+=1))
fi

while [[ $i -lt 5 ]] && $cont ; do
	cont=false
	if grep -q 'Rerun to get ' ${logfile} || grep -q 'undefined references' $logfile; then
		eval $PDF_LATEX
		cont=true
		((i++))
	fi
done

echo "pdflatex or bibtex ran $i times"
