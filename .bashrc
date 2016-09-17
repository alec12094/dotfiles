# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#For GoLang development
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

if [[ $- == *i* ]]; then
	grey='\[\033[1;30m\]'
	red='\[\e[38;5;172m\]'
	RED='\[\e[38;5;137m\]'
	green='\[\e[0;32m\]'
	GREEN='\[\033[1;32m\]'
	yellow='\[\033[0;33m\]'
	YELLOW='\[\033[1;33m\]'
	purple='\[\033[0;35m\]'
	PURPLE='\[\033[1;35m\]'
	white='\[\033[0;37m\]'
	WHITE='\[\033[1;37m\]'
	blue='\[\033[0;34m\]'
	BLUE='\[\033[1;34m\]'
	cyan='\[\033[0;36m\]'
	CYAN='\[\033[1;36m\]'
	NC='\[\033[0m\]'
	PS1="$CYAN\$(parse_git_branch)$CYAN\u:$cyan[\w]\[$(tput sgr0)\]\n"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias makedocker="AUTO_GOPATH=1 ./hack/make.sh dynbinary"
alias loadbinary="sudo systemctl stop docker
	sudo rm /usr/bin/docker && sudo rm /usr/bin/dockerinit 
	sudo cp bundles/latest/dynbinary/docker-1.*-dev /usr/bin/docker
	sudo cp bundles/latest/dynbinary/dockerinit-1.*-dev /usr/bin/dockerinit
	sudo systemctl daemon-reload
	sudo systemctl restart docker"
