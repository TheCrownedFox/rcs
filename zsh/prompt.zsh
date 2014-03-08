#!/bin/zsh

# set prompt
myPrompt='%{${magenta}[%T]${reset_color}${viMode}$(gitPrompt) $(hostPrompt):${green}$(customDirPath)>${reset_color}%} '

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
viCommandMode="${cyan}[CMD]${reset_color}"
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
    if [[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == true ]]; then
        currentBranch=$(gitBranch)
        # check if theres changes to commit
        if [ -z "$(git status --porcelain)" ]; then
            branchColor="${green}"
        else
            branchColor="${red}"
        fi
        # check if there are commits to push
        if [ -n "$(git status | grep 'branch is ahead')" ]; then
            bracketColor="${yellow}"
        else
            bracketColor="${white}"
        fi
        echo -n "${bracketColor}[${reset_color}${branchColor}${currentBranch}${reset_color}${bracketColor}]${reset_color}"
    fi
}

# set host prompt

hostPrompt() {
    # check if connected over ssh
    if [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ]; then
        echo -n "${red}%m${reset_color}"
    else
        echo -n "%m"
    fi
}


setopt PROMPT_SUBST # allows for commands to be run in the prompt
PS1=$myPrompt
