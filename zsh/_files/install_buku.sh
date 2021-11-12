#!/bin/bash

BUKU_URL="git@github.com:jarun/buku.git"
BUKU_PATH="${AG_TEMP}/buku"

PIPX_PKGS=( "buku" )
pipx_install "${PIPX_PKGS[@]}"

clone_repo "${BUKU_URL}" "${BUKU_PATH}"
(cd ${BUKU_PATH}; mv auto-completion/zsh/_buku ${AG_CONFIG}/zsh/completions/_buku)

exit 0
