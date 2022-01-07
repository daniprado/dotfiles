#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=(
  "${AG_CONFIG}/alacritty/alacritty-theme"
  "${AG_CONFIG}/alacritty/colors"
  "${AG_CONFIG}/zsh/completions/_alacritty"
)
remove "${LOCS[@]}"

exit 0
