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

COMPLETIONS="${ZSHSHARE}/completions"

source ${ZINIT_HOME}/bin/zinit.zsh

svn=""
# type "svn" >/dev/null && svn="svn"

zt(){ zinit $svn depth'1' reset light-mode lucid "${@}"; }
ztp(){ zinit depth'1' reset light-mode lucid "${@}"; }

ztp for zdharma-continuum/z-a-bin-gem-node

KERN=$(uname -s | tr A-Z a-z)
ARCH=$(uname -m)
[[ "${ARCH}" == "amd64" ]] && ARCH="x86_64"
if [[ "${ARCH}" == "x86_64" ]]; then
  ARCH_ALT="amd64"
elif [[ "${ARCH}" == "aarch64" ]]; then
  ARCH_ALT="arm64"
else
  ARCH_ALT=$"${ARCH}"
fi

mkdir -p ${ZSHMAN_1} ${ZSHMAN}/man5

ztp wait'0' for                                                 \
      OMZL::clipboard.zsh                                       \
      OMZP::git                                                 \
      zsh-vi-more/vi-motions                                    \
      hlissner/zsh-autopair                                     \
      @asdf-vm/asdf                                             \
  atload'!_zsh_autosuggest_start'                               \
      zsh-users/zsh-autosuggestions                             \
      djui/alias-tips

if [[ "${KERN}" == "linux" && "${ARCH}" == "x86_64" ]]; then
  ztp wait'0' for                                                 \
    atload'alias lsa="exa --long --all --modified --git --group"' \
        OMZL::directories.zsh
else
  ztp wait'0' for OMZL::directories.zsh
fi

if [[ "${KERN}" == "linux" ]]; then
  OHMP_VER="posh-${KERN}-${ARCH_ALT}"
  FD_VER="fd-*-${ARCH}-unknown-${KERN}-gnu.tar.gz"
  EXA_VER="exa-${KERN}-${ARCH}-*.zip"
  BAT_VER="bat-*-${ARCH}-unknown-${KERN}-gnu.tar.gz"
  ZK_VER="zk-*-${KERN}-${ARCH_ALT}.tar.gz"

  ztp wait'0' as'command' for                               \
    sbin"posh* -> oh-my-posh" from'gh-r' bpick"${OHMP_VER}" \
        JanDeDobbeleer/oh-my-posh                           \
    sbin'**/fd' from'gh-r' bpick"${FD_VER}"                 \
    atpull'%atclone' atclone"                               \
      cp **/fd.1 ${ZSHMAN_1};                               \
      rm ${XDG_BIN_HOME}/fd;                                \
      ln -s ${ZPFX}/bin/fd ${XDG_BIN_HOME}/fd"              \
        @sharkdp/fd                                         \
    trigger-load'!cat;!bat'                                 \
    sbin'**/bat' from'gh-r' bpick"${BAT_VER}"               \
    atpull'%atclone' atclone"                               \
      cp **/bat.zsh _bat;                                   \
      cp **/bat.1 ${ZSHMAN_1};                              \
      rm ${XDG_BIN_HOME}/bat;                               \
      ln -s ${ZPFX}/bin/bat ${XDG_BIN_HOME}/bat"            \
        @sharkdp/bat                                        \
    sbin'**/zk' from'gh-r' bpick"${ZK_VER}"                 \
    atpull'%atclone' atclone"                               \
      rm ${XDG_BIN_HOME}/zk;                                \
      ln -s ${ZPFX}/bin/zk ${XDG_BIN_HOME}/zk"              \
        @mickael-menu/zk

  if [[ "${ARCH}" == "x86_64" ]]; then
    JQ_VER="jq-${KERN}64"
    YH_VER="yh-${KERN}-${ARCH_ALT}.zip"
    BROOT_VER="${ARCH}-${KERN}"
    KUBECTX_VER="kubectx_*_${KERN}_${ARCH}.tar.gz"
    KUBENS_VER="kubens_*_${KERN}_${ARCH}.tar.gz"
    NVIM_VER="nvim.appimage"

    ztp wait'0' as'command' for                         \
      trigger-load'!ls;!lsa;!lst;!exa'                  \
      sbin'bin/exa' from'gh-r' bpick"${EXA_VER}"        \
      atpull'%atclone' atclone"                         \
        cp **/exa.zsh _exa;                             \
        cp **/exa.1 ${ZSHMAN_1};                        \
        cp **/exa*.5 ${ZSHMAN}/man5;                    \
        rm ${XDG_BIN_HOME}/exa;                         \
        ln -s ${ZPFX}/bin/exa ${XDG_BIN_HOME}/exa"      \
          ogham/exa                                     \
      sbin'jq' from'gh-r' bpick"${JQ_VER}"              \
      atpull'%atclone' atclone"                         \
        cp jq* jq;                                      \
        rm ${XDG_BIN_HOME}/jq;                          \
        ln -s ${ZPFX}/bin/jq ${XDG_BIN_HOME}/jq"        \
          stedolan/jq                                   \
      trigger-load'!br;!broot'                          \
      sbin'broot' from'gh-r'                            \
      atpull'%atclone' src='zhook.zsh' atclone"         \
        cp **/${BROOT_VER}/broot broot;                 \
        cp **/br*.1 ${ZSHMAN_1};                        \
        ./broot --print-shell-function zsh >zhook.zsh;  \
        ./broot --set-install-state installed;          \
        rm ${XDG_BIN_HOME}/broot;                       \
        ln -s ${ZPFX}/bin/broot ${XDG_BIN_HOME}/broot"  \
          Canop/broot                                   \
      trigger-load'!yh;!ky'                             \
      sbin'yh' from'gh-r' bpick"${YH_VER}"              \
          andreazorzetto/yh                             \
      trigger-load'!kubectx;!kctx' id-as'kubectx'       \
      sbin'kubectx' from'gh-r' bpick"${KUBECTX_VER}"    \
      atpull'%atclone' atclone"                         \
        curl -o ${COMPLETIONS}/_kubectx                 \
        ${KUBECTX_REPO}/master/completion/_kubectx.zsh; \
        zinit creinstall -q ${COMPLETIONS}"             \
          ahmetb/kubectx                                \
      trigger-load'!kubens;!kns' id-as'kubens'          \
      sbin'kubens' from'gh-r' bpick"${KUBENS_VER}"      \
      atpull'%atclone' atclone"                         \
        curl -o ${COMPLETIONS}/_kubens                  \
        ${KUBECTX_REPO}/master/completion/_kubens.zsh;  \
        zinit creinstall -q ${COMPLETIONS}"             \
          ahmetb/kubectx

    # Min Neovim version is 0.7.0
    CURR_NVIM_VER=$(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2)
    if [[ ${CURR_NVIM_VER} -lt 7 ]]; then
      ztp wait'0' as'command' for                 \
        sbin'nvim.appimage -> nvim'               \
        from'gh-r' ver'stable' bpick"${NVIM_VER}" \
            neovim/neovim
    fi
  fi
fi

DIRENV_VER="direnv.${KERN}-${ARCH_ALT}"
DUF_VER="duf_*_${KERN}_${ARCH_ALT}.tar.gz"
KUBECTX_REPO="https://raw.githubusercontent.com/ahmetb/kubectx"

ztp wait'0' as'command' for                    \
  sbin'direnv' from'gh-r' bpick"${DIRENV_VER}" \
  atpull'%atclone' atclone"                    \
    asdf plugin-add direnv;                    \
    asdf install direnv latest;                \
    asdf global direnv latest;                 \
    ./direnv hook zsh >zhook.zsh"              \
  src='zhook.zsh' mv'direnv* -> direnv'        \
      direnv/direnv                            \
  sbin'diff-so-fancy' from'gh-r'               \
      so-fancy/diff-so-fancy                   \
  trigger-load'!df;!duf'                       \
  sbin'duf' from'gh-r' bpick"${DUF_VER}"       \
      muesli/duf                               \
  trigger-load'!hcurl'                         \
  sbin'httpstat.sh -> hcurl'                   \
      b4b4r07/httpstat                         \
  trigger-load'!you-get'                       \
      soimort/you-get

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
  has'aws' trigger-load'!aws'                         \
      OMZP::aws                                       \
  has'gcloud'                                         \
      daniprado/fzf-gcloud                            \
  has'az' as'null' id-as'az' trigger-load'!az'        \
  atinit"source $(which az).completion.sh"            \
      ${COMPLETIONS}                                  \
  has'kubectl' trigger-load'!k;!kubectl'              \
  atinit'source <(kubectl completion zsh)'            \
      OMZP::kubectl                                   \
  has'vault' as'null' id-as'vault'                    \
  trigger-load'!vault'                                \
  atinit"complete -o nospace -C $(which vault) vault" \
      ${COMPLETIONS}

ztp wait'1' for                          \
      OMZL::completion.zsh               \
  blockf atpull'zinit creinstall -q .'   \
      zsh-users/zsh-completions          \
  atinit'zicompinit; zicdreplay'         \
      zsh-users/zsh-syntax-highlighting
