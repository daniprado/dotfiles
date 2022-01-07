#!/usr/bin/env zsh

alias tmux="NVIM_TMUX=1 tmux -2"
alias ssh="TERM=xterm-256color ssh"

alias _='sudo'
alias __='sudo --preserve-env=SSH_AUTH_SOCK'
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
# Min Neovim version is 0.5.0
[[ $(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2) -ge 5 ]] 2>/dev/null
if [[ $? -eq 0 ]]; then
  alias vim="nvim"
  [[ ! "${SSH_TTY}" ]] && alias gvim="NVIM_GUI=1 nvim-qt"
  [[ ! "${SSH_TTY}" ]] && export EDITOR="nvim-qt"
  [[ "${SSH_TTY}" ]] && export EDITOR="nvim"

  if type "nvr" >/dev/null; then
    export EDITOR="nvr -s --servername ${TMP}/nvimsocket_$(curr_dk)"
    alias nvim="${EDITOR}"
    [[ ! "${SSH_TTY}" ]] && alias nvim-qt="NVIM_GUI=1 NVR_CMD=nvim-qt ${EDITOR}"
  fi

  if type "nvr-tmux" >/dev/null; then
    export EDITOR="nvr-tmux -s --servername ${TMP}/nvimsocket_$(curr_dk)"
    alias nvim="${EDITOR}"
    [[ ! "${SSH_TTY}" ]] && alias nvim-qt="NVIM_GUI=1 NVR_CMD=nvim-qt ${EDITOR}"
  fi
fi
[[ ! "${SSH_TTY}" ]] && export VISUAL="${EDITOR}"

if type "bat" >/dev/null; then
  alias cat="bat"
  export PAGER="bat"
else
  export PAGER="/usr/bin/cat"
fi

if type "rg" >/dev/null; then
  alias grep="rg"
fi

if type "trash-put" >/dev/null; then
  alias rm="trash-put"
fi

if type "bpytop" >/dev/null; then
  alias btop="bpytop"
fi

if type "duf" >/dev/null; then
  alias df="duf"
fi

if type "podman" >/dev/null; then
  alias docker="podman"
fi

alias gfz="git fuzzy"
alias wg="sudo wg"
alias venv="python -m venv ."
alias renv="rm lib lib64 include bin pyvenv.cfg"
alias src="source ./bin/activate"
alias senv="venv && src"
alias json="python -m json.tool"
alias cal="noglob cal"
alias wshowkeys="wshowkeys -t 2 -a bottom -a right -m 100"

AGALIAS_PATH="${HOME}/.config/zsh/ag-alias.zsh"
if [[ -f "${AGALIAS_PATH}" ]]; then
  source "${AGALIAS_PATH}"
fi

