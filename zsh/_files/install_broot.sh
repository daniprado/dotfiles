#!/bin/bash

BROOT_URL="https://dystroy.org/broot/download/x86_64-linux/broot"
BRCOMP_URL="https://dystroy.org/broot/download/completion/_br"
BROOTCOMP_URL="https://dystroy.org/broot/download/completion/_broot"

(cd ${AG_BIN}; \
  rm br broot || echo "Broot not present"; \
  wget "${BROOT_URL}"; \
  chmod +x broot; \
  broot --install)

(cd ${AG_CONFIG}/zsh/completions; \
  rm _br _broot || echo "Broot autocomplete not present"; \
  wget "${BRCOMP_URL}"; \
  wget "${BROOTCOMP_URL}")

exit 0
