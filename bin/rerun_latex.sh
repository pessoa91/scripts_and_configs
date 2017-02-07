set -e

logfile=$1
PDF_LATEX=$2
BIBTEX=$3

i=1
cont=1
while [[ i -lt 5 ]] && [[ cont -eq 1 ]] ; do
	cont=0
	((i++))

	if grep -q 'Rerun to get ' ${logfile} ; then
		$PDF_LATEX
		cont=1
	fi

	if grep -q 'Citation .* undefined' $logfile || grep -q 'undefined references' $logfile; then
		$BIBTEX
		cont=1
	fi
done
	
echo "pdflatex or bibtex ran $i times"

