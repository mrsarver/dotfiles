#!/usr/bin/env bash

#==============================================================================#
#                               AWESOME ALIASES                                #
#                                Matthew Sarver                                #
#==============================================================================#

#==============================================================================#
# General Quality of Life                                                      #
#==============================================================================#
alias wget='wget -c'

# package manager configs
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias uu='update && upgrade'
alias install='sudo apt-get install '
alias search='sudo apt-cache search '

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lha='ls -lha'

# git configs
alias g='git status'
alias gf='git fetch'
alias gpll='git pull'
alias gpsh='git push'
alias gc='git commit -S'

# automatically use color for less
alias less='less -R'

alias fuck='sudo $(history -p \!\!)'
alias refresh='source ~/.bashrc'

# > the new millenium
# > using vi
alias vi='vim'

# always make the directory
alias mkdir='mkdir -p'

# run nemo without starting a desktop
alias nemo='nemo --no-desktop'

# lol
# alias killme=':(){ :|: & }:;'

#==============================================================================#
# Navigation                                                                   #
#==============================================================================#
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

function cd() {
    newDir=$*
    if [ $# -eq 0 ]; then
        newDir=$HOME
    fi
    builtin cd $newDir && ls -a
}

#==============================================================================#
# Platform Specific Aliases                                                    #
#==============================================================================#

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    platform='linux'
elif [[ "$unamestr" == "Darwin" ]]; then
    platform='osx'
fi

if [[ $platform == 'osx' ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome &> /dev/null &'
fi

#==============================================================================#
# Compression                                                                  #
#==============================================================================#
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

#==============================================================================#
# No more ../../../../../../../../../../../                                    #
#==============================================================================#
function up()
{
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}
