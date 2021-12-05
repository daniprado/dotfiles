#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=( "${AG_CONFIG}/telegram" "${AG_SSH}/sockets" )
remove "${LOCS[@]}"

ASDF_PATH="${AG_CONFIG}/asdf"
ASDF_COMPE_PATH="${AG_CONFIG}/zsh/completions/_asdf"
BUKU_PATH="${AG_TEMP}/buku"
BUKU_COMPE_PATH="${AG_CONFIG}/zsh/completions/_buku"
DSF_PATH="${AG_SHARE}/diff-so-fancy"
DSF_BIN_PATH="${AG_BIN}/diff-so-fancy"
FZF_PATH="${AG_CONFIG}/fzf"
FZF_BIN_PATH="${AG_BIN}/fzf"
FZFT_BIN_PATH="${AG_BIN}/fzf-tmux"
ZINIT_PATH="${AG_CONFIG}/zsh/zinit"

LOCS_P=( "${ASDF_PATH}" "${ASDF_COMPE_PATH}" "${BUKU_PATH}" "${BUKU_COMPE_PATH}" "${DSF_PATH}" "${DSF_BIN_PATH}" "${FZF_PATH}" "${FZF_BIN_PATH}" "${FZFT_BIN_PATH}" "${ZINIT_PATH}" )
remove "${LOCS_P[@]}"

exit 0
