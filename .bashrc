#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls --color=auto -al'
alias la='ls --color=auto -l'
alias ls='ls --color=auto'
alias hib='systemctl hibernate'
alias pvim='gvim -p'
alias fathura='zathura --fork'
alias L='ssh -Y lhcscrub@lxplus.cern.ch'
alias P='ssh -Y pdijksta@lxplus.cern.ch'
alias trimport='import -trim'
alias I='ipython2 --pylab'

# Colored prompt
COLOR="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="${COLOR}[\u@\h \W]\$ ${RESET}"
#PS1='[\u@\h \W]\$'

# No Bell
#xset -b # Uncommented for now, as it is disabled in BIOS.

# Variables
uni="/mnt/shared/daten/daten_uni"

# Environment variables
export VISUAL="vim"
export MANPAGER="vimpager"
export LESSHISTFILE="-"
export GNUPGHOME=/home/philipp
export XDG_CACHE_HOME=/home/philipp/.cache
export XDG_CONFIG_HOME=/home/philipp/.config

export PYTHONPATH='/home/philipp/pythonpath'

# Functions
. ~/bin/bashfunctions.sh

gitlocalpdijksta(){
	git config --local user.email "philipp.dijkstal@cern.ch"
	git config --local user.name "Philipp Dijkstal"
}
