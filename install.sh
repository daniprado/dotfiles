#!/bin/sh

[[ "${XDG_RUNTIME_DIR}" != "${HOME}"* ]] && export XDG_RUNTIME_DIR="/tmp"
export AG_RUNTIME="${XDG_RUNTIME_DIR}"
export AG_TEMP="${HOME}/tmp"

GETPIP_URL="https://bootstrap.pypa.io/get-pip.py"
GETPIP_PATH="${AG_TEMP}/get-pip.py"

[[ ! -L "${AG_TEMP}" ]] && ln -s ${AG_RUNTIME} ${AG_TEMP}

curl ${GETPIP_URL} -o ${GETPIP_PATH} && python ${GETPIP_PATH}
(cd ~; pip install --user pipx)

[[ -f "./script/install.sh" ]] && ./script/install.sh

exit 0
