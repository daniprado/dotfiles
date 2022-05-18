#!/bin/bash

[[ "${XDG_RUNTIME_DIR}" != "${HOME}"* ]] && export XDG_RUNTIME_DIR="/tmp"
export AG_RUNTIME="${XDG_RUNTIME_DIR}"
export AG_TEMP="${HOME}/tmp"

GETPIP_URL="https://bootstrap.pypa.io/get-pip.py"
GETPIP_PATH="${AG_TEMP}/get-pip.py"

[[ ! -L "${AG_TEMP}" ]] && ln -s ${AG_RUNTIME} ${AG_TEMP}

if [[ ! -z "${AG_INSTALL}" ]]; then
  if type "pacman" >/dev/null; then
    sudo pacman -S python python-virtualenv python-pip gcc make which zsh
  elif type "apt" >/dev/null; then
    sudo apt install -y python-is-python3 python3-venv python3-pip zsh
  elif type "dnf" >/dev/null; then
    sudo dnf install python python-venv python-pip devtools which zsh
  fi
fi

curl ${GETPIP_URL} -o ${GETPIP_PATH} && python ${GETPIP_PATH}
(cd ${HOME}; pip install --user pipx)

if [[ -f "./script/install.sh" ]]; then
  ./script/install.sh
  export PATH="${HOME}/.local/bin:${PATH}"
  ag-dotfiler --op install shell
fi

exit 0
