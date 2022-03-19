#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh
CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

PIP_PACKAGES=( "i3ipc" )
pip_install "${PIP_PACKAGES[@]}"

pkg_install "sway" \
  "sway swaybar swaylock wayvnc kanshi mako remmina zathura gammastep qt5ct ydotool bitwarden-cli swappy grim slurp alacritty" \
  "-"

FOLDERS=( "${XDG_SHARE_HOME}/base16" )
create_folders "${FOLDERS[@]}"

PIPX_PKGS=( "pybase16-builder" )
pipx_install "${PIPX_PKGS[@]}"

exe "(cd ${XDG_SHARE_HOME}/base16; pybase16 update)"

exe "openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \\
  -keyout \"${AG_CONFIG}/wayvnc/key.pem\" \\
  -out \"${AG_CONFIG}/wayvnc/certificate.pem\" -subj /CN=localhost \\
  -addext subjectAltName=DNS:localhost,DNS:localhost,IP:127.0.0.1"

exe "(cd ${CURR_PATH}; ./install_ulauncher.sh)"

exit 0
