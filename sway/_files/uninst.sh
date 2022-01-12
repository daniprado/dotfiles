#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=(
  "${AG_CONFIG}/ulauncher/user-themes"
  "${AG_CONFIG}/alacritty"
)
remove "${LOCS[@]}"

exit 0
