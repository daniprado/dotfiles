#!/usr/bin/env zsh

export ASDF_DIR="${XDG_CONFIG_HOME}/asdf"
export ASDF_DATA_DIR="${ASDF_DIR}"
export ASDF_CONFIG_FILE="${ASDF_DIR}/asdfrc"

# direnv activates this per folder...
# source $ASDF_DIR/asdf.sh

eval "$(direnv hook zsh)"

