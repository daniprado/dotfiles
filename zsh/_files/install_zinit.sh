#!/bin/bash

ZINIT_URL="https://github.com/zdharma-continuum/zinit.git"
ZINIT_PATH="${AG_SHARE}/zsh/zinit"
ZINIT_BIN="${ZINIT_PATH}/bin"
COMPLETIONS_PATH="${AG_SHARE}/zsh/completions"

FOLDERS=( "${ZINIT_PATH}" "${COMPLETIONS_PATH}" )
create_folders "${FOLDERS[@]}"

clone_repo "${ZINIT_URL}" "${ZINIT_BIN}"

exit 0
