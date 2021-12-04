#!/bin/bash

ZINIT_URL="https://github.com/zdharma-continuum/zinit.git"
ZINIT_PATH="${AG_CONFIG}/zsh/zinit"
ZINIT_BIN="${ZINIT_PATH}/bin"

FOLDERS=( "${ZINIT_PATH}" )
create_folders "${FOLDERS[@]}"

clone_repo "${ZINIT_URL}" "${ZINIT_BIN}"

exit 0
