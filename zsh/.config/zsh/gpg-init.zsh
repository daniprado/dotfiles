pkill -9 gpg-agent
rm /run/user/`id -u`/gnupg/S*

unset SSH_AGENT_PID
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
#
gpgconf --launch gpg-agent

