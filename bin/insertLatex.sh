#!/bin/bash

debug=false
output=/tmp/latestInsertLatex.txt
mark=MARKßß

#redirect output
exec > $output

[[ $# -ne 1 ]] && ( echo "error" ; exit )

$debug && echo $1 >> ~/debugLatex.txt

cutInput=$(sed -e "s/ //g" -e "s/\t//g" <<< $1)
$debug && echo $cutInput >> ~/debugLatex.txt


case $cutInput in
	align\* )
		echo \
"\\begin{align*}
	$mark
	\\label{eq:}
\\end{align*}"
		;;
	ali*)
		echo \
"\\begin{align}
	$mark
	\\label{eq:}
\\end{align}"
		;;
	table)
		echo  \
"\\begin{table}[tbh]
	\\centering
	\\begin{tabular}{|c|c|c|}
	\\hline
	$mark
	\\end{tabular}
	\\caption{
	}
	\\label{tab:}
\\end{table}"
		;;
	tabular)
	echo \
"\\begin{tabular}{|c|c|c|}
	\\hline
	$mark
\\end{tabular}"
	;;
	Fig*)
		echo \
"\\begin{Figure}
	\\centering
	\\includegraphics[width=\\textwidth]{$mark}
	\\captionof{figure}{}
	\\label{fig:}
\\end{Figure}"
		;;
	fig*)
		echo \
"\\begin{figure}[tbh]
	\\centering
	\\includegraphics[width=0.8\textwidth]{$mark}
	\\caption{
	}
	\\label{fig:}
\\end{figure}"
		;;
	minifig*)
		echo \
"\\begin{figure}[tbh]
	\\centering
	\\begin{minipage}[c]{0.47\\textwidth}
		\\includegraphics[width=\\textwidth]{$mark}
		\\caption{
		}
		\\label{fig:}
	\\end{minipage}
	\\hspace{0.5cm}
	\\begin{minipage}[c]{0.47\\textwidth}
		\\includegraphics[width=\\textwidth]{}
		\\caption{
		}
		\\label{fig:}
	\\end{minipage}
\\end{figure}"
		;;
	wrap*)
		echo \
"
\\begin{wrapfigure}{R}{0.35\\textwidth}
	\\vspace{-10pt}
	\\centering
	\\includegraphics[width=0.35\\textwidth]{}
	\\caption{
	}
	\\label{fig:}
	\\vspace{-20pt}
\\end{wrapfigure}
"
	;;
	ite*)
		echo \
"\\begin{itemize}
	\\item $mark
\\end{itemize}"
		;;
	frame)
		echo \
"\\begin{frame}
	\\frametitle{$mark}
\\end{frame}"
		;;
	columns)
		echo \
"\\begin{columns}
\\column{0.5\\textwidth}
	$mark
\\column{0.5\\textwidth}

\\end{columns}"
		;;
	mini*)
		echo \
"\\begin{minipage}[c]{0.48\textwidth}
	$mark
\\end{minipage}"
		;;
	*)
		echo \
"\\begin{$cutInput}
	$mark
\\end{$cutInput}"
esac
