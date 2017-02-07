#!/bin/bash


output=/tmp/latestInsertLatex.txt
mark=MARKßß

[[ $# -ne 1 ]] && ( echo error > $output ; exit )

#echo $1 >> ~/debugLatex.txt

cutInput=$(echo $1 | sed -e "s/ //g" -e "s/\t//g")
#echo $cutInput >> ~/debugLatex.txt

#echo $cutInput > ~/.cutInput 

case $cutInput in 
	align\* )
		echo \
"\\begin{align*}
	$mark
	\\label{eq:}
\\end{align*}" > $output
		;;
	ali*)
		echo \
"\\begin{align}
	$mark
	\\label{eq:}
\\end{align}" > $output
		;;
	table)
		echo  \
"\\begin{table}[tbh] 
	\\centering 
	\\begin{tabular}{|c|c|c|}
	\\hline 
	$mark
	\\end{tabular}
	\\caption{}
	\\label{tab:}
\\end{table}" > $output
		;;
	Fig*)
		echo \
"\\begin{Figure}
	\\centering
	\\includegraphics[width=\\textwidth]{$mark}
	\\captionof{figure}{}
	\\label{fig:}
\\end{Figure}" > $output
		;;
	fig*)
		echo \
"\\begin{figure}[tbh]
	\\centering
	\\includegraphics[width=0.8\textwidth]{$mark}
	\\caption{}
	\\label{fig:}
\\end{figure}" > $output
		;;
	ite*)
		echo \
"\\begin{itemize}
	\\item $mark
\\end{itemize}" > $output
		;;
	frame)
		echo \
"\\begin{frame}
	\\frametitle{$mark}
\\end{frame}" > $output
		;;
	columns)
		echo \
"\\begin{columns}
\\column{0.5\\textwidth}
	$mark
\\column{0.5\\textwidth}

\\end{columns}" > $output
		;;
	*)
		echo \
"\\begin{$cutInput}
	$mark		
\\end{$cutInput}" > $output
esac
