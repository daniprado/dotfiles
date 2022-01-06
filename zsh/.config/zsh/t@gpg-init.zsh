#!/usr/bin/env zsh

GPG_AGENT_PID=$(pgrep gpg-agent)
GPG_AGENT_TMP="/run/user/$(id -u)/gnupg"
if [[ "${GPG_AGENT_PID}" ]]; then
  kill -9 ${GPG_AGENT_PID}
  tail --pid=${GPG_AGENT_PID} -f /dev/null
  [[ -e "${GPG_AGENT_TMP}/S.gpg-agent" ]] && rm ${GPG_AGENT_TMP}/S*
  unset SSH_AGENT_PID
fi

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# export SSH_AUTH_SOCK="${GPG_AGENT_TMP}/S.gpg-agent.ssh"

gpgconf --launch gpg-agent
