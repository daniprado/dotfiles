#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh
CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

FOLDERS=( "${AG_CACHE}/zsh" "${AG_CONFIG}/telegram" "${AG_SSH}/sockets" )
create_folders "${FOLDERS[@]}"

PIPX_PKGS=( "trash-cli" "telegram-send" "sshtunnel" "bpytop" "asciinema" "buku" )
pipx_install "${PIPX_PKGS[@]}"

pkg_install "fd" "fd-find" "fd"
pkg_install "tmate"

ZSH_BIN=$(which zsh)
if [[ "${ZSH_BIN}" != *"${SHELL}" ]]; then
  exe "chsh --shell ${ZSH_BIN}"
fi

exe "(cd ${CURR_PATH}; ./install_gpg.sh)"
exe "(cd ${CURR_PATH}; ./install_zinit.sh)"
exe "(cd ${CURR_PATH}; ./install_ripgrep.sh)"
exe "(cd ${CURR_PATH}; ./install_fzf.sh)"
exe "(cd ${CURR_PATH}; ./install_tmux.sh)"

exit 0
