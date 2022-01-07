#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=(
  "${AG_CONFIG}/telegram"
  "${AG_SSH}/sockets"
)
remove "${LOCS[@]}"

LOCS_P=(
  "${AG_CONFIG}/asdf"
  "${AG_CONFIG}/zsh/completions/_asdf"
  "${AG_TEMP}/buku"
  "${AG_CONFIG}/zsh/completions/_buku"
  "${AG_SHARE}/diff-so-fancy"
  "${AG_BIN}/diff-so-fancy"
  "${AG_CONFIG}/fzf"
  "${AG_BIN}/fzf"
  "${AG_BIN}/fzf-tmux"
  "${HOME}/.gnupg/gpg-agent.conf"
  "${AG_CONFIG}/zsh/zinit"
)
remove "${LOCS_P[@]}"

exit 0
