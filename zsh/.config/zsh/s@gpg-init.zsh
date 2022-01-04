#!/usr/bin/env zsh

unset SSH_AGENT_PID
export GPG_TTY="$(tty)"

gpgconf --launch gpg-agent

