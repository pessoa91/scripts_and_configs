#!/bin/bash
#1. check arguments

[[ $# -ne 1 ]] && echo "error: number of arguments is not 1" && exit
[[ $1 != *.tex ]] && echo "error: input file is not a .tex file" && exit
[[ -e $1 ]] || ( echo "error: input file does not exist" && exit )

#2. define argument to scons

inputFileName=$1
inputLength=${#inputFileName}
cutLength=$((inputLength-4))
cutFileName=${inputFileName:0:$cutLength}

#3. create Sconstruct if necessary
if  ! [[ -e "SConstruct" ]] ; then
	echo -e "env = Environment()\nenv.PDF(target=\"${cutFileName}.pdf\", source=\"${cutFileName}.tex\")\n" > SConstruct
	echo "${cutFileName}.pdf" > SConstruct_filename
fi

#4. run scons
scons $(cat SConstruct_filename)
