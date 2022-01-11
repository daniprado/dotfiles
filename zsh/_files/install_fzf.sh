#!/bin/bash

FZF_URL="https://github.com/junegunn/fzf.git"
FZF_PATH="${AG_SHARE}/fzf"

clone_repo "${FZF_URL}" "${FZF_PATH}" "--depth 1"

${FZF_PATH}/install --bin --no-bash --no-fish --key-bindings --completion
create_link "${FZF_PATH}/bin/fzf" "${AG_BIN}/fzf"
create_link "${FZF_PATH}/bin/fzf-tmux" "${AG_BIN}/fzf-tmux"

exit 0
