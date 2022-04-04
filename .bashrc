#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tree='tree -C'
alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
PS1='\[\e[0;33m\][\[\e[m\e[0;32m\]\u\[\e[m\e[0;33m\]:\[\e[m\] \[\e[1;34m\]\w\[\e[m\e[0;33m\]]$\[\e[m\] '
#PS1='\[\e[0;33m[\e\][m\e[0;32m\u\e[m\e[0;33m:\e[m \[\e[1;34m\w\e[m\]\[\e[0;33m]\$\e[m\] '
# unlimited bash history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
