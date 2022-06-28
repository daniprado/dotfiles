function curr_dk() {
  swaymsg &>/dev/null
  if [[ $? -eq 0 ]]; then
    swaymsg --type get_outputs | jq -r ".[] | select(.focused==true) | .current_workspace" | grep -v null | cut -d' ' -f1
  else
    echo ${TTY} | cut -d'/' -f4
  fi
}

function ag_nvr() {
  nvr_file="${HOME}/tmp/nvimsocket_$(curr_dk)"

  prog="${EDITOR}"
  [[ ${nvr_role} == "listen" ]] && [[ ! -z "${NVIM_GUI}" ]] && prog="${VISUAL}"

  nvr_role="listen"
  [[ -S "${nvr_file}" ]] && nvr_role="server"

  params="$@"
  [[ $# -gt 0 ]] && params="--remote $@"

  EXEC="${prog} --${nvr_role} ${nvr_file} ${params}"

  echo "${EXEC}" >> ~/test_nvr
  eval "${EXEC}"
}
