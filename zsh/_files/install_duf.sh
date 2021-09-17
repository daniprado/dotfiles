#!/bin/bash

DUF_VERSION="0.6.2"
DUF_FILE="duf_${DUF_VERSION}_linux_x86_64.tar.gz"
DUF_URL="https://github.com/muesli/duf/releases/download/v${DUF_VERSION}/${DUF_FILE}"

(cd ${AG_TEMP}; wget "${DUF_URL}"; tar xzvf ${DUF_FILE}; cp duf ${AG_BIN})

exit 0
