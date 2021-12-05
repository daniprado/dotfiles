#!/bin/bash

[[ "${XDG_RUNTIME_DIR}" != "${HOME}"* ]] && export XDG_RUNTIME_DIR="/tmp"
export AG_RUNTIME="${XDG_RUNTIME_DIR}"
export AG_TEMP="${HOME}/tmp"

GETPIP_URL="https://bootstrap.pypa.io/get-pip.py"
GETPIP_PATH="${AG_TEMP}/get-pip.py"

[[ ! -L "${AG_TEMP}" ]] && ln -s ${AG_RUNTIME} ${AG_TEMP}

if [[ ! -z "${AG_INSTALL}" ]]; then
  if type "pacman" >/dev/null; then
    sudo pacman -S python python-venv
  elif type "apt" >/dev/null; then
    sudo apt install python-is-python3 python-venv
  elif type "yum" >/dev/null; then
    sudo yum install python python-venv
  fi
fi

curl ${GETPIP_URL} -o ${GETPIP_PATH} && python ${GETPIP_PATH}
(cd ~; pip install --user pipx)

if [[ -f "./script/install.sh" ]]; then
  ./script/install.sh
  export PATH="${HOME}/.local/bin:${PATH}"
  ag-dotfiler --op install shell
fi

exit 0
