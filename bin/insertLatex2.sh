#!/bin/bash

debug=false

whitespace="$(sed 's|^\([ \t]*\).*$|\1|' /tmp/latestLine.txt)"

if debug ; then
	echo "--" >> ~/debugLatex.txt
	cat /tmp/latestLine.txt >> ~/debugLatex.txt
	echo $whitespace >> ~/debugLatex.txt
	echo $( wc -c <<< $whitespace) >> ~/debugLatex.txt
fi

~/bin/insertLatex.sh $(cat /tmp/latestLine.txt)

sed -i "s/^/$whitespace/" /tmp/latestInsertLatex.txt
