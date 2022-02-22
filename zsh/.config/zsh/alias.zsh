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
# Min Neovim version is 0.6.0
if [[ $(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2) -ge 6 ]] 2>/dev/null; then
  alias vim="nvim"
  if [[ -n "${WAYLAND_DISPLAY}" ]]; then
    alias gvim="NVIM_GUI=1 nvim-qt"
    export EDITOR="nvim-qt"
  else
    export EDITOR="nvim"
  fi

  if type "nvr" >/dev/null; then
    export EDITOR="nvr -s --servername ${TMP}/nvimsocket_$(curr_dk)"
    export NOSOCK_EDITOR="nvim"
    alias nvim="${EDITOR}"
    [[ -n "${WAYLAND_DISPLAY}" ]] && alias nvim-qt="NVIM_GUI=1 NVR_CMD=nvim-qt ${EDITOR}"
  fi
fi
[[ -z "${NOSOCK_EDITOR}" ]] && export NOSOCK_EDITOR="${EDITOR}"
[[ -n "${WAYLAND_DISPLAY}" ]] && export VISUAL="${EDITOR}"

if type "bat" >/dev/null; then
  alias cat="bat"
  export PAGER="bat"
else
  export PAGER="/usr/bin/cat"
fi

type "rg" >/dev/null && alias grep="rg"
type "trash-put" >/dev/null && alias rm="trash-put"
type "bpytop" >/dev/null && alias btop="bpytop"
type "duf" >/dev/null && alias df="duf"
type "wshowkeys" >/dev/null && alias wshowkeys="wshowkeys -t 2 -a bottom -a right -m 100"
type "podman" >/dev/null && alias docker="podman"
type "wg" >/dev/null alias wg="sudo wg"

alias venv="python -m venv ."
alias src="source ./bin/activate"
alias senv="venv && src"
alias renv="rm -rf lib lib64 include bin pyvenv.cfg"
alias json="python -m json.tool"
alias cal="noglob cal"
alias gzt="br -ghc :gs"
alias kctx="kubectx"
alias kns="kubens"
alias sops="EDITOR=${NOSOCK_EDITOR} sops"
alias helm="EDITOR=${NOSOCK_EDITOR} helm"

AGALIAS_PATH="${HOME}/.config/zsh/ag-alias.zsh"
[[ -f "${AGALIAS_PATH}" ]] && source "${AGALIAS_PATH}"
