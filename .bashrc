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
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# my aliases
alias hib='systemctl hibernate'
alias fathura='zathura --fork'
alias trimport='import -trim'
alias I='ipython3 --pylab'
alias Cdfirst='cd $(ls | head -n1)'

# Old stuff
#alias ratlab='matlab -r "run(\'~/Dropbox/psi/matlab/init.m\')"'
#export RPN_DEFNS=~/Downloads/defns.rpn
#export ele=~/Dropbox/psi/elegant

gitlocalpdijksta(){
	git config --local user.email "philipp.dijkstal@psi.ch"
	git config --local user.name "Philipp Dijkstal"
}

