#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

THEME_PATH="${AG_CONFIG}/alacritty/alacritty-theme"
COLORS_PATH="${AG_CONFIG}/alacritty/colors"
COMPE_PATH="${AG_CONFIG}/zsh/completions/_alacritty"

LOCS=( "${THEME_PATH}" "${COLORS_PATH}" "${COMPE_PATH}" )
remove "${LOCS[@]}"

exit 0
