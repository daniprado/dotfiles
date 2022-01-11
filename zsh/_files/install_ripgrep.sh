#!/bin/bash

RIPGREP_VERSION="13.0.0"
RIPGREP_PKG="ripgrep_${RIPGREP_VERSION}_amd64.deb"
RIPGREP_URL="https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/${RIPGREP_PKG}"
RIPGREP_REPO="https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo"

if [[ ! -z "${AG_INSTALL}" ]]; then

  if ! type rg >/dev/null; then
    type "yum" >/dev/null && sudo yum-config-manager --add-repo=${RIPGREP_REPO}
    pkg_install "ripgrep" "ripgrep" "-" "ripgrep"

    if type "apt" >/dev/null; then
      (cd ${AG_TEMP} && \
        curl -LO ${RIPGREP_URL} && \
        sudo dpkg -i ${RIPGREP_PKG})
    fi
  fi
fi

exit 0
