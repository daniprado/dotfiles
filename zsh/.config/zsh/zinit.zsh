#!/usr/bin/env zsh

ZINIT_HOME=${ZSHSHARE}/zinit
ZPFX=${ZINIT_HOME}/polaris
declare -A ZINIT
ZINIT[HOME_DIR]=${ZINIT_HOME}
ZINIT[BIN_DIR]=${ZINIT_HOME}/bin
ZINIT[PLUGINS_DIR]=${ZINIT_HOME}/plugins
ZINIT[COMPLETIONS_DIR]=${ZINIT_HOME}/completions
ZINIT[SNIPPETS_DIR]=${ZINIT_HOME}/snippets
ZINIT[ZCOMPDUMP_PATH]=${HOME}/.zcompdump
ZINIT[COMPINIT_OPTS]="-C"
ZINIT[MUTE_WARNINGS]="1"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"

source ${ZINIT_HOME}/bin/zinit.zsh

svn=""
# type "svn" >/dev/null && svn="svn"

zt(){ zinit $svn depth'1' reset light-mode lucid "${@}"; }
ztp(){ zinit depth'1' reset light-mode lucid "${@}"; }

ztp for                                                 \
  nocd atload"source ${ZSHCONF}/theme.zsh; _p9k_precmd" \
      romkatv/powerlevel10k                             \
      zdharma-continuum/z-a-bin-gem-node

ztp wait'0' for                                                 \
      OMZL::clipboard.zsh                                       \
      OMZP::git                                                 \
      zsh-vi-more/vi-motions                                    \
      hlissner/zsh-autopair                                     \
      @asdf-vm/asdf                                             \
  atload'!_zsh_autosuggest_start'                               \
      zsh-users/zsh-autosuggestions                             \
  atload'alias lsa="exa --long --all --modified --git --group"' \
      OMZL::directories.zsh                                     \
      djui/alias-tips

DIRENV_VER="*linux-amd64*"
BROOT_VER="*x86_64-linux*"
DUF_VER="*linux_x86_64*"
YH_VER="*linux-amd64*"
NVIM_VER="nvim.appimage"

KUBECTX_REPO="https://raw.githubusercontent.com/ahmetb/kubectx"
KUBECTX_VER="kubectx*linux_x86_64*"
KUBENS_VER="kubens*linux_x86_64*"

mkdir -p ${ZSHMAN_1} ${ZSHMAN}/man5

ztp wait'0' as'command' for                              \
  sbin'jq' from'gh-r'                                    \
  atclone'cp jq* jq' atpull'%atclone'                    \
      stedolan/jq                                        \
  sbin'direnv' from'gh-r' bpick"${DIRENV_VER}"           \
  atclone'./direnv hook zsh >zhook.zsh' atpull'%atclone' \
  src='zhook.zsh' mv'direnv* -> direnv'                  \
      direnv/direnv                                      \
  sbin'**/fd' from'gh-r'                                 \
  atclone"cp **/fd.1 ${ZSHMAN_1}" atpull'%atclone'       \
      @sharkdp/fd                                        \
  sbin'diff-so-fancy'                                    \
      so-fancy/diff-so-fancy                             \
  sbin'bin/exa' from'gh-r'                               \
  trigger-load'!ls;!lsa;!lst;!exa'                       \
  atclone"
    cp **/exa.zsh _exa; \
    cp **/exa.1 ${ZSHMAN_1}; \
    cp **/exa*.5 ${ZSHMAN}/man5
  " atpull'%atclone'                                     \
      ogham/exa                                          \
  sbin'**/bat' from'gh-r'                                \
  trigger-load'!cat;!bat'                                \
  atclone"
    cp **/bat.zsh _bat; \
    cp **/bat.1 ${ZSHMAN_1}
  " atpull'%atclone'                                     \
      @sharkdp/bat                                       \
  sbin'broot' from'gh-r'                                 \
  trigger-load'!br;!broot'                               \
  atclone"
    cp **/${BROOT_VER}/broot broot; cp **/br*.1 ${ZSHMAN_1}; \
    ./broot --print-shell-function zsh >zhook.zsh; \
    ./broot --set-install-state installed
  " atpull'%atclone' src='zhook.zsh'                     \
      Canop/broot                                        \
  sbin'duf' from'gh-r' bpick"${DUF_VER}"                 \
  trigger-load'!df;!duf'                                 \
      muesli/duf                                         \
  trigger-load'!hcurl'                                   \
  sbin'httpstat.sh -> hcurl'                             \
      b4b4r07/httpstat                                   \
  trigger-load'!kubectx;!kctx' id-as'kubectx'            \
  sbin'kubectx' from'gh-r' bpick"${KUBECTX_VER}"         \
  atclone"
    curl -o ${ZINIT[COMPLETIONS_DIR]}/_kubectx \
    ${KUBECTX_REPO}/master/completion/_kubectx.zsh; \
    zinit creinstall -q ${ZINIT[COMPLETIONS_DIR]}
  " atpull'%atclone'                                     \
      ahmetb/kubectx                                     \
  trigger-load'!kubens;!kns' id-as'kubens'               \
  sbin'kubens' from'gh-r' bpick"${KUBENS_VER}"           \
  atclone"
    curl -o ${ZINIT[COMPLETIONS_DIR]}/_kubens \
    ${KUBECTX_REPO}/master/completion/_kubens.zsh; \
    zinit creinstall -q ${ZINIT[COMPLETIONS_DIR]}
  " atpull'%atclone'                                     \
      ahmetb/kubectx                                     \
  sbin'yh' from'gh-r' bpick"${YH_VER}"                   \
  trigger-load'!yh;!ky'                                  \
      andreazorzetto/yh                                  \
  trigger-load'!you-get'                                 \
      soimort/you-get

# Min Neovim version is 0.6.0
CURR_NVIM_VER=$(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2)
if [[ ${CURR_NVIM_VER} -lt 6 ]]; then
  ztp wait'0' as'command' for                 \
    sbin'nvim.appimage -> nvim'               \
    from'gh-r' ver'stable' bpick"${NVIM_VER}" \
        neovim/neovim
fi

zt wait'0' for                                        \
  trigger-load'!man'                                  \
      ael-code/zsh-colored-man-pages                  \
  has'tmux' trigger-load'!tmux'                       \
      OMZP::tmux                                      \
  has'task' trigger-load'!t;!task'                    \
      OMZP::taskwarrior                               \
  trigger-load'!cpv'                                  \
      OMZP::cp                                        \
  trigger-load'!copyfile'                             \
      OMZP::copyfile                                  \
      OMZP::copybuffer                                \
  trigger-load'!trans'                                \
  atclone"cp **/trans.1 ${ZSHMAN_1}" atpull'%atclone' \
      soimort/translate-shell                         \
  trigger-load'!gi;!gii'                              \
      voronkovich/gitignore.plugin.zsh                \
  has'terraform' trigger-load'!terraform;!tf'         \
      OMZP::terraform                                 \
  has'helm' trigger-load'!helm'                       \
      OMZP::helm                                      \
  as'completion' blockf                               \
      OMZP::ripgrep/_ripgrep                          \
  has'pip' trigger-load'!pip'                         \
  as'completion' blockf                               \
      OMZP::pip/_pip                                  \
  has'docker-compose' trigger-load'!docker-compose'   \
  as'completion' blockf                               \
      OMZP::docker-compose/_docker-compose            \
  has'gcloud'                                         \
      daniprado/fzf-gcloud

ztp wait'1' for                            \
      OMZL::completion.zsh                 \
  blockf atpull'zinit creinstall -q .'     \
      zsh-users/zsh-completions            \
  atinit'zicompinit; zicdreplay'           \
      zsh-users/zsh-syntax-highlighting    \
  has'kubectl'                             \
  atinit'source <(kubectl completion zsh)' \
      OMZP::kubectl
