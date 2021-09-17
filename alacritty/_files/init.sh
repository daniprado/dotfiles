#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

THEME_PATH="${AG_CONFIG}/alacritty/alacritty-theme"
THEME_REPO="https://github.com/eendroroy/alacritty-theme.git"

pkg_install "alacritty" "alacritty" "-"

clone_repo "${THEME_REPO}" "${THEME_PATH}"
if [[ "$?" -eq 0 ]]; then
  create_link "${THEME_PATH}/themes" "${AG_CONFIG}/alacritty/colors"
  create_link "/usr/share/zsh/site-functions/_alacritty" "${AG_CONFIG}/zsh/completions/_alacritty"
fi

pipx_install "alacritty-colorscheme"

exit 0
