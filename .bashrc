# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -al'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#. /opt/psi/config/profile.bash
#sleep 3s
#killall /opt/psi/Tools/Pmodules/0.99.1/bin/bash

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Xresources are needed for e.g. urxvt
[[ -f ~/.Xresources ]] && [[ ! -z $DISPLAY ]] && xrdb ~/.Xresources

# my aliases
alias hib='systemctl hibernate'
alias fathura='zathura --fork'
alias trimport='import -trim'
alias I='ipython3 --pylab'
alias Cdfirst='cd $(ls | head -n1)'
alias rdp='/usr/bin/xfreerdp -d psich --plugin cliprdr -x lan -g 1350x980 --no-nla -u dijkstal_p winterm3'
alias E='ssh -Y philipdi@euler.ethz.ch'
alias CDbeamdynamicsPhilipp='cd /afs/psi.ch/intranet/SF/Beamdynamics/Philipp'
#[[ $(hostname) =~ ^sf-lc.* ]] && alias python='python3' || alias python='python3.4'
alias SE='cd /afs/psi.ch/intranet/SF/Beamdynamics/Philipp/Eduard3 && . README2 && python EmitMeasToolMain.py'
alias jabref='/usr/java/jdk1.8.0_191-amd64/bin/java -jar ~/bin/JabRef-4.3.1.jar'
alias PY35='source /opt/gfa/python 3.5'
alias PY37='module load psi-python37'
[[ $(hostname) == pc11292.psi.ch ]] && PY37
alias gvim='~/bin/vim -g '
alias libreoffice='libreoffice7.2'

# Old stuff
#alias ratlab='matlab -r "run(\'~/Dropbox/psi/matlab/init.m\')"'
#export RPN_DEFNS=~/Downloads/defns.rpn
#export ele=~/Dropbox/psi/elegant

# my exports
export EDITOR=vim
export PYTHONPATH=$HOME/pythonpath
export IPYTHONDIR=~/.ipython
export RPN_DEFNS=~/bin/defns.rpn
export VIMRUNTIME=~/vim/runtime
export PATH=/storage/texlive/bin/x86_64-linux:$PATH
export TEXDIR=/storage/texlive
#     main tree:      /storage/texlive/texmf-dist

export TEXMFLOCAL=/storage/texlive/texmf-local
export TEXMFSYSVAR=/storage/texlive/texmf-var
export TEXMFSYSCONFIG=/storage/texlive/texmf-config
export TEXMFVAR=~/.texlive2021/texmf-var
export TEXMFCONFIG=~/.texlive2021/texmf-config
export TEXMFHOME=~/texmf

export PDFIMPORT_RESOLUTION_DPI=600 # libreoffice pdf imports


gitlocalpdijksta(){
	git config --local user.email "philipp.dijkstal@psi.ch"
	git config --local user.name "Philipp Dijkstal"
}

eulerRsync(){
	rsync -auv philipdi@euler.ethz.ch:$1 $2
}

loadvim(){
	module use Tools
	module load Python/2.7.14
	module load gcc/4.8.5
	module load vim/8.0.586
}

startEmit(){
	CDbeamdynamicsPhilipp
	cd Eduard3
	. README2
	python EmitMeasToolMain.py
}

SSHLCA(){
	ssh -X -t sf-gw 'ssh -X sf-lca'
}

Mountsf(){
	sudo mount gfa05:/export/sf /sf
}

BackupElegant(){
	rsync -auv /home/philipp/elegant /afs/psi.ch/group/8122/Philipp/
}

