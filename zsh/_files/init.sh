#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh
CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

FOLDERS=( "${AG_CACHE}/zsh" "${AG_CONFIG}/telegram" "${AG_SSH}/sockets" )
create_folders "${FOLDERS[@]}"

PIPX_PKGS=( "trash-cli" "telegram-send" "sshtunnel" "bpytop" "asciinema" "buku" )
pipx_install "${PIPX_PKGS[@]}"

pkg_install "fd" "fd-find" "fd"
pkg_install "tmate"
pkg_install "gawk"

ZSH_BIN=$(which zsh)
[[ "${ZSH_BIN}" = *"${SHELL}" ]] || exe "chsh --shell ${ZSH_BIN}"

OHMP_URL="https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64"
OHMP_BIN="${AG_BIN}/oh-my-posh"
[[ -f "${OHMP_BIN}" ]] || \
  (cd ${AG_BIN}; \
  wget ${OHMP_URL} -O ${OHMP_BIN}; \
  chmod +x ${OHMP_BIN})

exe "(cd ${CURR_PATH}; ./install_gpg.sh)"
exe "(cd ${CURR_PATH}; ./install_zinit.sh)"
exe "(cd ${CURR_PATH}; ./install_ripgrep.sh)"
exe "(cd ${CURR_PATH}; ./install_fzf.sh)"
exe "(cd ${CURR_PATH}; ./install_tmux.sh)"
[[ -z "${INST_CLOUD}" ]] || exe "(cd ${CURR_PATH}; ./install_cloud.sh)"

exit 0
