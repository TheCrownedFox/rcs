
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
alias chromeos="sudo cgpt -i 6 -P 0 -S 1 /dev/sda"
alias git-diff="git difftool --tool=vimdiff"
alias zrc="source ~/.zshrc"
alias wifi="sudo wifi-menu mlan0"
# moving up dirs
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."
alias uuuuu="cd ../../../../.."

# set some env vars
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=chromium
export TZ=America/Denver

# set vi mode
bindkey -v

# history file stuff
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# set prompt
autoload -U colors && colors
PS1="%{%{$fg[magenta]%}[%T]%{$reset_color%} %n@%m:%{$fg[green]%}%~#%{$reset_color%}%} "

# enable autocompletion
autoload -U compinit
compinit

# no beeping sound
unsetopt BEEP

# extended globbing features
setopt EXTENDED_GLOB

# change title of terminal emulator on directory change
chpwd() { print -Pn "\e]2;zsh %~\a" }
