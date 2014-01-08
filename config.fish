
# some aliases that seem nice
alias ls "ls --color=auto"
alias grep "grep --color=auto"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
alias ll "ls -alF"
alias la "ls -A"

# serve files
alias serve_php "php -S 127.0.0.1:3000"

# set term to be 256 colors
set TERM xterm-256color

# set vim as default editor
set EDITOR /usr/bin/vim

# utility aliases for programs I use
#alias emacs "emacs -nw"
# edit todo file
alias vt "vim ~/Documents/todo.md"
# edit fish config
alias vf "vim ~/rcs/config.fish"
# edit rcs directory
alias rcs "vim ~/rcs/"

alias asgard "ssh -o PORT=8081 austin@lightningcougar.dyndns.info"
alias chromeos "sudo cgpt -i 6 -P 0 -S 1 /dev/sda"
alias git-diff "git difftool --tool=vimdiff"
alias wifi "sudo wifi-menu mlan0"

# moving up dirs
alias u "cd .."
alias uu "cd ../.."
alias uuu "cd ../../.."
alias uuuu "cd ../../../.."
alias uuuuu "cd ../../../../.."

# add ~/bin to path variable for my own shell scripts
set PATH $PATH /home/austin/bin  $HOME/.rvm/bin 
#/home/austin/android-sdks/tools/ /home/austin/android-sdks/platform-tools/

# add ruby rvm stuff to PATH

# sudo !! function
function sudo!!
	eval sudo $history[1]
end
