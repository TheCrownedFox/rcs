#!/bin/zsh

source ~/.zshenv
# some common aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -alF"
alias la="ls -A"
# serve php files
alias serve_php="php -S 127.0.0.1:3000"
# some convienence aliases
alias vt="vim ~/Documents/todo.md"
alias todo=vt
alias rcs="vim ~/rcs"
alias asgard="ssh -o PORT=8081 austin@lightningcougar.dyndns.info"
alias imagine="ssh adivines@imagine.mines.edu"
alias chromeos="sudo cgpt -i 6 -P 0 -S 1 /dev/sda"
alias git-diff="git difftool --tool=vimdiff"
alias zrc="source ~/.zshrc"
alias wifi="sudo wifi-menu mlan0"
alias takeNote="vim $(date +%Y_%m_%d.md)"
alias emacs="emacs -nw"
alias ec="emacsclient -nw"
alias ecc="emacsclient -nw"
alias cls="clear; ls"
alias newTerm="(urxvtc &)"
# moving up dirs
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."
alias uuuuu="cd ../../../../.."

# set some env vars
export EDITOR=vim
export BROWSER=chromium
export TZ=America/Denver
export KEYTIMEOUT=1
export LS_COLORS="ow=93;41;1"
# set term on Asgard
if [[ $(cat /etc/hostname) == "Asgard" ]]; then
    export TERM=xterm-256color
    PATH=$HOME/bin/nand2tetris:$PATH
fi

# set vi mode
bindkey -v
bindkey \^U backward-kill-line
bindkey \^R history-incremental-search-backward

# rvm thing
[[ -s "$HOME/.rvm/scripts/rvm" ]] &&  . "$HOME/.rvm/scripts/rvm"

# history file stuff
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=65536
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt NO_HIST_BEEP
# allow colors
autoload -U colors && colors
black="%{$fg[black]%}"
green="%{$fg[green]%}"
blue="%{$fg[blue]%}"
cyan="%{$fg[cyan]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"
magenta="%{$fg[magenta]%}"
white="%{$fg[white]%}"
reset_color="%{$reset_color%}"

if [[ $(cat /etc/hostname) == "Eir" ]]; then
    PATH=$HOME/bin/nand2tetris/:$PATH
    if [[ $(ps -e | grep 'xmonad') != '' ]]; then
        xmodmap $HOME/.Xmodmap
    fi
fi

# get color in man pages
man() {
    if [[ $TERM != 'linux' ]]; then
        command \
        env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
    else
        command man "$@"
    fi
}

# load prompt
source $HOME/rcs/zsh/prompt.zsh


# enable autocompletion
autoload -U compinit
compinit

# no beeping sound
unsetopt BEEP

# extended globbing features
setopt EXTENDED_GLOB

chpwd() { 
    # change title of terminal emulator on directory change
    print -Pn "\e]2;zsh %~\a"
    # change promp to match new cwd
    PS1=$myPrompt
}

