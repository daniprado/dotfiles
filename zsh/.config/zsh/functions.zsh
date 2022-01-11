#!/usr/bin/env zsh

function chpwd() {
  print -l $PWD ${(u)dirstack} >${DIRSTACKFILE}
}

function xterm_title_precmd () {
  print -Pn '\e]2;%~\a'
}

function zle-expand-alias() {
  zle _expand_alias
}

function cal() {
  python3 -c "from math import *; print($*);"
}

function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --hidden --iglob !.git --iglob !.cache --iglob !.nvm --iglob !.npm --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function fifall() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --hidden --iglob !.git --iglob !.cache --iglob !.nvm --iglob !.npm --no-messages "$1"
}

function tree() {
    br -sc :pt "$@"
}

function gzt() {
    br -ghc :gs
}

function timer() {
  date1=`date +%s`; while true; do 
     echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
   done
}

function curr_dk() {
  swaymsg &>/dev/null
  if [[ $? -eq 0 ]]; then
    swaymsg --type get_outputs | jq -r ".[] | select(.focused==true) | .current_workspace" | grep -v null | cut -d' ' -f1
  else
    echo ${TTY} | cut -d'/' -f4
  fi
}

# TODO Tratar de entender esto...
function cmd_tempos() {
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
      echoti smkx
    }
    function zle-line-finish() {
      echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
  fi
}
