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

function sp() {
    ps aux | rg -v rg | rg $1 | awk '{ print $2 }'
}

alias getip="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"

function mkcd() {
    mkdir -p $1 && cd $_
}

alias clock="tty-clock -scB"

alias getidf='. $HOME/esp/esp-idf/export.sh'
alias getdbt='. $HOME/.local/venv/dbt-env/bin/activate'
alias getlocust='. $HOME/.local/venv/locust-env/bin/activate'

alias nv="neovide"
