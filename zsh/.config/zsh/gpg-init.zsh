#!/usr/bin/env zsh

if [[ "$(whoami)" == "$(logname)" ]]; then
  if [[ ! "${SSH_TTY}" ]]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    # export SSH_AUTH_SOCK="${GPG_AGENT_TMP}/S.gpg-agent.ssh"
  fi

  export GPG_TTY="$(tty)"
  gpgconf --launch gpg-agent
fi

