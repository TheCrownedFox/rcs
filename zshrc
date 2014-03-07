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
# moving up dirs
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."
alias uuuuu="cd ../../../../.."

# set some env vars
#export TERM=xterm-256color
export EDITOR=vim
export BROWSER=chromium
export TZ=America/Denver
export KEYTIMEOUT=1

# set vi mode
bindkey -v
bindkey \^U backward-kill-line

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

# set prompt
myPrompt='%{%{$fg[magenta]%}[%T]%{$reset_color%} ${viMode} $(gitPrompt) %m:%{$fg[green]%}$(customDirPath)>%{$reset_color%}%} '
# creates fish style cwd
customDirPath() {
    if [[ $PWD == '/' ]]; then
        echo -n '/'
    elif [[ $PWD == $HOME ]]; then
        echo -n '~'
    elif [[ $PWD/ == $HOME/* ]]; then
        directories=($(echo $PWD | tr '/' ' '))
        directories=(${directories[3, -1]})
        newPath='~'
        for d in $directories; do
            newPath=${newPath}/${d:0:1}
        done
        echo -n $newPath
    else
        directories=($(echo $PWD | tr '/' ' '))
        newPath=''
        for d in $directories; do
            newPath=${newPath}/${d:0:1}
        done
        echo -n $newPath
    fi
}

# get vi mode in prompt
viInsertMode="[INS]"
viCommandMode="%{$fg[cyan]%}[CMD]%{$reset_color%}"
viMode=$viInsertMode

# called on keymap change
function zle-keymap-select {
    # change viMode to match proper mode
    viMode="${${KEYMAP/vicmd/${viCommandMode}}/(main|viins)/${viInsertMode}}"
    # update prompt
    PS1=$myPrompt
    # redraw prompt
    zle reset-prompt
}
zle -N zle-keymap-select

# called on line finish
function zle-line-finish {
    # set viMode back to insert
    viMode=$viInsertMode
}
zle -N zle-line-finish

function TRAPINT() {
    viMode=$viInsertMode
    PS1=$myPrompt
    zle && zle reset-prompt
    return $(( 128 + $1 ))
}

# put git info in prompt

gitBranch() {
    echo -n $(git rev-parse --abbrev-ref HEAD)
}

gitPrompt() {
    if [ -d .git ]; then
        currentBranch=$(gitBranch)
        if [ -z "$(git status --porcelain)" ]; then
            branchColor="%{$fg[green]%}"
        else
            branchColor="%{$fg[red]%}"
        fi
        echo -n "${branchColor}${currentBranch}%{$reset_color%}"
    fi
}

setopt PROMPT_SUBST # allows for commands to be run in the prompt
PS1=$myPrompt

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

