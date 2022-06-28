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
# Min Neovim version is 0.7.0
if [[ $(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2) -ge 7 ]] 2>/dev/null; then
  alias vim="nvim"
  export EDITOR="$(type -p nvim | cut -d' ' -f 3)"
  type "nvim-qt" &>/dev/null && export VISUAL="$(type -p nvim-qt | cut -d' ' -f 3)"
  type "goneovim" &>/dev/null && export VISUAL="$(type -p goneovim | cut -d' ' -f 3)"

  alias nvim="ag_nvr"
  alias gvim="NVIM_GUI=1 ag_nvr"
fi

if type "bat" >/dev/null; then
  alias cat="bat"
  export PAGER="bat"
else
  export PAGER="/usr/bin/cat"
fi

alias venv="python -m venv ."
alias src="source ./bin/activate"
alias senv="venv && src"
alias renv="rm -rf lib lib64 include bin pyvenv.cfg"
alias json="python -m json.tool"
alias cal="noglob cal"
alias gzt="br -ghc :gs"

type "rg" &>/dev/null && alias grep="rg"
type "trash-put" &>/dev/null && alias rm="trash-put"
type "bpytop" &>/dev/null && alias btop="bpytop"
type "duf" &>/dev/null && alias df="duf"
type "wshowkeys" &>/dev/null && alias wshowkeys="wshowkeys -t 2 -a bottom -a right -m 100"
type "podman" &>/dev/null && alias docker="podman"
type "wg" &>/dev/null alias wg="sudo wg"
type "kubectx" &>/dev/null && alias kctx="kubectx"
type "kubens" &>/dev/null && alias kns="kubens"

AGALIAS_PATH="${HOME}/.config/zsh/ag-alias.zsh"
[[ -f "${AGALIAS_PATH}" ]] && source "${AGALIAS_PATH}"
