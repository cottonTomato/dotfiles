#!/bin/sh

function idezel() {
  if [[ ! -z $ZELLIJ_SESSION_NAME ]]; then
    echo "Cannot run within Zellij session. Detach from Current Session First."
    return 1
  fi

  sname="${PWD##*/}"
  session_list="$(zellij list-sessions --short)"

  if echo $session_list | grep -q $sname; then
    zellij attach $sname
  else
    zellij --session $sname --layout ide
  fi
}
