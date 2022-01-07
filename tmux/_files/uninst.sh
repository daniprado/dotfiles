#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=(
  "${PLUGINS_PATH}/tpm"
  "${AG_CACHE}/tmux/plugins"
)
remove "${LOCS[@]}"

exit 0
