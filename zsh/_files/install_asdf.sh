#!/bin/bash

ASDF_URL="https://github.com/asdf-vm/asdf.git"
ASDF_PATH="${AG_CONFIG}/asdf"
DIRENV_URL="https://direnv.net/install.sh"

clone_repo ${ASDF_URL} ${ASDF_PATH}
(cd ${ASDF_PATH}; git checkout "$(git describe --abbrev=0 --tags)")

create_link "${ASDF_PATH}/completions/_asdf" "${AG_CONFIG}/zsh/completions/_asdf"

curl -sfL ${DIRENV_URL} | sh

exit 0
