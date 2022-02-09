#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=(
  "${HOME}/.gnupg/gpg-agent.conf"
  "${AG_CONFIG}/zsh"
  "${AG_SHARE}/zsh"
  "${AG_SHARE}/fzf"
  "${AG_SHARE}/tmux"
  "${AG_SHARE}/google-cloud-sdk"
  "${AG_BIN}/fzf*"
  "${AG_CONFIG}/telegram"
)
remove "${LOCS[@]}"

exit 0
