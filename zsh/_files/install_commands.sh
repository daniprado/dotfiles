#!/bin/bash

EXA_VERSION="v0.10.1"
BAT_VERSION="v0.18.3"
RIPGREP_VERSION="13.0.0"

EXA_FILE="exa-linux-x86_64-${EXA_VERSION}.zip"
BAT_FOLDER="bat-${BAT_VERSION}-x86_64-unknown-linux-musl"
RIPGREP_PKG="ripgrep_${RIPGREP_VERSION}_amd64.deb"

EXA_URL="https://github.com/ogham/exa/releases/download/${EXA_VERSION}/${EXA_FILE}"
BAT_URL="https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/${BAT_FOLDER}.tar.gz"
RIPGREP_URL="https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/${RIPGREP_PKG}"
RIPGREP_REPO="https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo"

if [[ ! -z "${AG_INSTALL}" ]]; then
  pkg_install "exa" "exa" "exa" "-"
  pkg_install "bat" "bat" "bat" "-"

  type "yum" >/dev/null && sudo yum-config-manager --add-repo=${RIPGREP_REPO}
  pkg_install "ripgrep" "ripgrep" "-" "ripgrep"
fi

if ! type rg >/dev/null; then
  (cd ${AG_TEMP} && \
    curl -LO ${RIPGREP_URL} && \
    sudo dpkg -i ${RIPGREP_PKG})
fi

if ! type exa >/dev/null; then
  (cd ${AG_TEMP} && \
    curl -LO "${EXA_URL}" && \
    unzip ./${EXA_FILE} && \
    chmod +x ./bin/exa && \
    mv bin/exa ${AG_BIN})
fi

if ! type bat >/dev/null; then
  (cd ${AG_TEMP} && \
    curl -LO "${BAT_URL}" && \
    tar xzvf ${BAT_FOLDER}.tar.gz && \
    chmod +x ./${BAT_FOLDER}/bat && \
    mv ./${BAT_FOLDER}/bat ${AG_BIN})
fi

exit 0
