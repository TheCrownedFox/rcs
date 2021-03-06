# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500
HISTFILESIZE=500

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
# THE STUFF THAT I DID!!!
#

# set ECLIPSE-HOME env variable to point to ~/opt/
ECLIPSE_HOME=/home/austin/opt/eclipse

# set a different prompt if logged in via ssh
# currently switches color to red
if [ -n "$SSH_CLIENT" ] ; then
    export PS1='\[\e[0;31m\]\u@\h:\w\$\[\e[m\] '
fi

# force 256 color terminal
TERM=xterm-256color

# set vim as default editor

EDITOR=/usr/bin/vim

# set :q to exit terminal window like it quits in vim
alias :q=exit
alias asgard="ssh -o PORT=8081 austin@lightningcougar.dyndns.info"
alias chromeos="sudo cgpt -i 6 -P 0 -S 1 /dev/sda"
alias git-diff="git difftool --tool=vimdiff "
alias eclimd="$ECLIPSE_HOME/eclimd"
alias eclim-down="$ECLIPSE_HOME/eclim -command shutdown"
alias emacs='emacs -nw'

# set aliases for traveling up directories quickly
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias uuuuuu='cd ../../../../../..'
alias uuuuuuu='cd ../../../../../../..'
alias uuuuuuuu='cd ../../../../../../../..'
alias uuuuuuuuu='cd ../../../../../../../../..'
alias uuuuuuuuuu='cd ../../../../../../../../../..'
alias uuuuuuuuuuu='cd ../../../../../../../../../../..'


# set vi mode
set -o vi

# add ~/bin to path variable for my own shell scripts
PATH=$PATH:/home/austin/bin:/home/austin/android-sdks/tools/:/home/austin/android-sdks/platform-tools/

# add ruby rvm stuff to PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# add dmd to PATH
PATH=$PATH:$HOME/opt/dmd2/linux/bin64

[[ -s "$HOME/.rvm/scripts/rvm" ]] & source "$HOME/.rvm/scripts/rvm"

if [[ $USER == "adivines" ]]; then
    alias python3='~/python/Python-3.3.2/python'
    alias gem=gem1.9.3
    alias ruby=ruby1.9.3
    alias rake=rake1.9.3
    export GEM_HOME=~/.gem
    export GEM_PATH=$GEM_HOME/bin
    export PATH=$GEM_PATH:$PATH
fi

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------


