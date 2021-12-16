#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh
CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

FOLDERS=( "${AG_CACHE}/zsh" "${AG_CONFIG}/telegram" "${AG_SSH}/sockets" )
create_folders "${FOLDERS[@]}"

PIPX_PKGS=( "trash-cli" "telegram-send" "sshtunnel" "bpytop" "asciinema" )
pipx_install "${PIPX_PKGS[@]}"

pkg_install "fd" "fd-find" "fd"
pkg_install "tmate"

ZSH_BIN=$(which zsh)
if [[ "${ZSH_BIN}" != *"${SHELL}" ]]; then
  exe "chsh --shell ${ZSH_BIN}"
fi

exe "git config --global pull.rebase false"

exe "(cd ${CURR_PATH}; ./install_commands.sh)"
exe "(cd ${CURR_PATH}; ./install_zinit.sh)"
exe "(cd ${CURR_PATH}; ./install_fzf.sh)"
exe "(cd ${CURR_PATH}; ./install_diffsofancy.sh)"
exe "(cd ${CURR_PATH}; ./install_broot.sh)"
exe "(cd ${CURR_PATH}; ./install_asdf.sh)"
exe "(cd ${CURR_PATH}; ./install_duf.sh)"
exe "(cd ${CURR_PATH}; ./install_buku.sh)"

echo "--- Execute -----------------------"
echo "source ${CURR_PATH}/setup_zinit.zsh"
echo "-----------------------------------"

exit 0
