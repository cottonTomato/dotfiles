#!/bin/zsh

alias cls="clear"

function ep() {
    echo ${PATH} | sed -e $'s/:/\\\n/g'
}

alias ls="eza --icons --group-directories-first"
alias la="eza --icons --group-directories-first -a"
alias ll="eza --icons --group-directories-first --git -l"
alias lla="eza --icons --group-directories-first --git -la"

alias loadtime="for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done"

alias sp="ps aux | rg -v rg | rg"

alias gts="git status"

alias clock="tty-clock -scB"

alias cc="clang"
alias c++="clang++"

alias getidf='. $HOME/esp/esp-idf/export.sh'
