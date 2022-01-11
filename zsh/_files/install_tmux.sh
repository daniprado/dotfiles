#!/bin/bash

CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

TPM_URL="https://github.com/tmux-plugins/tpm"
TMUX_PLUGIN_MANAGER_PATH="${AG_SHARE}/tmux/plugins"
TPM_PATH="${TMUX_PLUGIN_MANAGER_PATH}/tpm"

pkg_install "tmux"

FOLDERS=( "${TMUX_PLUGIN_MANAGER_PATH}" )
create_folders "${FOLDERS[@]}"

exe "tmux kill-server"
# pipx_install ( "fpp" )
clone_repo "${TPM_URL}" "${TPM_PATH}"
exe "${TPM_PATH}/bin/install_plugins"
exe "(cd \"${TMUX_PLUGIN_MANAGER_PATH}/tmux-powerline\"; git apply \"${CURR_PATH}/0001-Argallar.patch\")"

exit 0
