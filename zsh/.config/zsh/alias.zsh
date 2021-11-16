#!/usr/bin/env zsh

alias tmux="NVIM_TMUX=1 tmux -2"
alias ssh="TERM=xterm-256color ssh"

alias _='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls --color=auto'
if type "exa" >/dev/null; then
  alias lst="exa --long --all --modified --git --sort=modified"
  alias lss="exa --long --all --modified --git --tree --recurse --git-ignore"
  alias lsa="exa --long --all --modified --git --group"
  alias lsd="exa --long --all --modified --git --only-dirs"
  alias lsz="exa --long --all --modified --git --sort=size"
else
  alias lst="ls -latrh"
  alias lss="ls -laSrh"
  alias lsa="ls -lah"
fi

alias vi="vim"
export EDITOR="vim"
if type "nvim" >/dev/null; then
  alias vim="nvim"
  alias gvim="NVIM_GUI=1 nvim-qt"
  export EDITOR="nvim-qt"
fi
if type "nvr" >/dev/null; then
  export EDITOR="nvr -s --servername ${HOME}/tmp/nvimsocket_$(curr_dk)"
  alias nvim="${EDITOR}"
  alias nvim-qt="NVIM_GUI=1 NVR_CMD=nvim-qt ${EDITOR}"
fi
if type "nvr-tmux" >/dev/null; then
  export EDITOR="nvr-tmux -s --servername ${HOME}/tmp/nvimsocket_$(curr_dk)"
  alias nvim="${EDITOR}"
  alias nvim-qt="NVIM_GUI=1 NVR_CMD=nvim-qt ${EDITOR}"
fi
export VISUAL="${EDITOR}"

alias gfz="git fuzzy"
BAT_PATH="~/.local/bin/bat"
if type "batcat" >/dev/null && [[ ! -f "${BAT_PATH}" ]]; then
  ln -s /usr/bin/batcat "${BAT_PATH}"
fi
if type "bat" >/dev/null; then
  alias cat="bat"
  export PAGER="bat"
else
  export PAGER="/usr/bin/cat"
fi

if type "rg" >/dev/null; then
  alias grep="rg"
fi

alias wg="sudo wg"

if type "trash-put" >/dev/null; then
  alias rm="trash-put"
fi

if type "bpytop" >/dev/null; then
  alias btop="bpytop"
fi

if type "duf" >/dev/null; then
  alias df="duf"
fi

alias venv="python -m venv ."
alias renv="rm lib lib64 include bin pyvenv.cfg"
alias src="source ./bin/activate"
alias json="python -m json.tool"
alias cal='noglob cal'

AGALIAS_PATH="${HOME}/.config/zsh/ag-alias.zsh"
if [[ -f "${AGALIAS_PATH}" ]]; then
  source "${AGALIAS_PATH}"
fi



