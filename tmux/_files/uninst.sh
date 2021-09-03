#!/bin/sh

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

TPM_PATH="${PLUGINS_PATH}/tpm"
PLUGINS_PATH="${AG_CACHE}/tmux/plugins"

LOCS=( "${TPM_PATH}" "${PLUGINS_PATH}" )
remove "${LOCS[@]}"

exit 0
