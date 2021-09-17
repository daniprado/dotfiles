#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PLUGINS_PATH="${AG_CACHE}/tmux/plugins"
TPM_URL="https://github.com/tmux-plugins/tpm"
TPM_PATH="${PLUGINS_PATH}/tpm"

pkg_install "tmux"

FOLDERS=( "${PLUGINS_PATH}" )
create_folders "${FOLDERS[@]}"

exe "tmux kill-server"
# pipx_install ( "fpp" )
clone_repo "${TPM_URL}" "${TPM_PATH}"
exe "TMUX_PLUGIN_MANAGER_PATH=\"${PLUGINS_PATH}\" ${TPM_PATH}/bin/install_plugins"
exe "(cd \"${PLUGINS_PATH}/tmux-powerline\"; git apply \"${CURR_PATH}/0001-Argallar.patch\")"

exit 0
