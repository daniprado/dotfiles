#!/bin/bash

GPGAGENT_CFG="${HOME}/.gnupg/gpg-agent.conf"

tee ${GPGAGENT_CFG} >/dev/null <<EOF
enable-ssh-support
ttyname \$GPG_TTY
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program ${AG_BIN}/pinentry
EOF

exit 0
