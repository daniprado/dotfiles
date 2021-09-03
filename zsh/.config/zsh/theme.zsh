typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Based on romkatv/powerlevel10k/config/p10k-rainbow.zsh, checksum 15915.
# Wizard options: nerdfont-complete + powerline, large icons, rainbow, unicode,
# 24h time, angled separators, sharp heads, flat tails, 2 lines, dotted, right frame,
# darkest-ornaments, sparse, many icons, concise, transient_prompt,
# instant_prompt=verbose.
# Tip: Looking for a nice color? Here's a one-liner to print colormap.
#   for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  autoload -Uz is-at-least && is-at-least 5.1 || return

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # os_icon                 # os identifier
    context                 # user@hostname
    dir                     # current directory
    vcs                     # git status
    status                  # exit code of the last command
    # =========================[ Line #2 ]=========================
    newline                 # \n
    prompt_char             # prompt symbol
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    # direnv                  # direnv status (https://direnv.net/)
    # asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    # anaconda                # conda environment (https://conda.io/)
    # pyenv                   # python environment (https://github.com/pyenv/pyenv)
    # goenv                   # go environment (https://github.com/syndbg/goenv)
    # nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
    # nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
    # nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
    # node_version          # node.js version
    # go_version            # go version (https://golang.org)
    # rust_version          # rustc version (https://www.rust-lang.org)
    # dotnet_version        # .NET version (https://dotnet.microsoft.com)
    # php_version           # php version (https://www.php.net/)
    # laravel_version       # laravel php framework version (https://laravel.com/)
    # java_version          # java version (https://www.java.com/)
    # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
    # rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
    # rvm                     # ruby version from rvm (https://rvm.io)
    # fvm                     # flutter version management (https://github.com/leoafarias/fvm)
    # luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
    # jenv                    # java version from jenv (https://github.com/jenv/jenv)
    # plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
    # phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
    # haskell_stack           # haskell version from stack (https://haskellstack.org/)
    # kubecontext             # current kubernetes context (https://kubernetes.io/)
    # aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    # aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
    # gcloud                  # google cloud cli account and project (https://cloud.google.com/)
    # google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
    # nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
    ranger                  # ranger shell (https://github.com/ranger/ranger)
    # nnn                     # nnn shell (https://github.com/jarun/nnn)
    vim_shell               # vim shell indicator (:sh)
    # midnight_commander      # midnight commander shell (https://midnight-commander.org/)
    # nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    # vi_mode               # vi mode (you don't need this if you've enabled prompt_char)
    # vpn_ip                # virtual private network indicator
    # load                  # CPU load
    # disk_usage            # disk usage
    # ram                   # free RAM
    # swap                  # used swap
    # todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
    # timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    # taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    time                    # current time
    # =========================[ Line #2 ]=========================
    newline
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
    terraform               # terraform workspace (https://www.terraform.io)
    # ip                    # ip address and bandwidth usage for a specified network interface
    # public_ip             # public IP address
    # proxy                 # system-wide http/https/ftp proxy
    # battery               # internal battery
    # wifi                  # wifi speed
    # example               # example user-defined segment (see prompt_example function below)
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate
  # POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
  # POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%238F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%238F─┤'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%238F─╯'

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='·'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=015
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  #################################[ os_icon: os identifier ]##################################
  # typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
  # typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7
  # typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⭐'

  ################################[ prompt_char: prompt symbol ]################################
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  ##################################[ dir: current directory ]##################################
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=004
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=016
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=017
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=017
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v2
  # typeset -g POWERLEVEL9K_LOCK_ICON='⭐'
  # typeset -g POWERLEVEL9K_DIR_WORK_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_DIR_WORK_BACKGROUND=4
  # typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=254
  # typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=250
  # typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=255
  # typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_BACKGROUND=4
  # typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_FOREGROUND=254
  # typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_SHORTENED_FOREGROUND=250
  # typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_ANCHOR_FOREGROUND=255
  #
  # typeset -g POWERLEVEL9K_DIR_CLASSES=()
  # typeset -g POWERLEVEL9K_DIR_PREFIX='in '

  #####################################[ vcs: git status ]######################################
  # typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2
  # typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3
  # typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
  # typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=3
  # typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  function my_git_formatter() {
    emulate -L zsh
    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    local       meta='%7F' # white foreground
    local      clean='%0F' # black foreground
    local   modified='%0F' # black foreground
    local  untracked='%0F' # black foreground
    local conflicted='%1F' # red foreground

    local res
    local where  # branch or tag
    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}"
      where=${(V)VCS_STATUS_LOCAL_BRANCH}
    elif [[ -n $VCS_STATUS_TAG ]]; then
      res+="${meta}#"
      where=${(V)VCS_STATUS_TAG}
    fi

    (( $#where > 32 )) && where[13,-13]="…"
    res+="${clean}${where//\%/%%}"  # escape %

    [[ -z $where ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"  # escape %
    fi

    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
  # typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_VCS_PREFIX='on '
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  ##########################[ status: exit code of the last command ]###########################
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
  # typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
  # typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
  # typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
  # typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0
  typeset -g POWERLEVEL9K_STATUS_ERROR=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  # typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
  # typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
  # typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
  # typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
  # typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
  # typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

  ###################[ command_execution_time: duration of the last command ]###################
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

  #######################[ background_jobs: presence of background jobs ]#######################
  # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
  # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ direnv: direnv status (https://direnv.net/) ]########################
  # typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=3
  # typeset -g POWERLEVEL9K_DIRENV_BACKGROUND=0
  # typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
  #typeset -g POWERLEVEL9K_ASDF_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_BACKGROUND=7
  #typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.js|package.json'
  #typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=
  #typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND=1
  ## typeset -g POWERLEVEL9K_ASDF_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_ASDF_PYTHON_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_PYTHON_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_ASDF_GOLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_GOLANG_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND=2
  ## typeset -g POWERLEVEL9K_ASDF_NODEJS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND=208
  ## typeset -g POWERLEVEL9K_ASDF_RUST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_RUST_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND=5
  ## typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_ASDF_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_ASDF_LUA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_LUA_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=1
  #typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND=7
  ## typeset -g POWERLEVEL9K_ASDF_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_ASDF_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND=1
  ## typeset -g POWERLEVEL9K_ASDF_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND=5
  ## typeset -g POWERLEVEL9K_ASDF_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND=6
  ## typeset -g POWERLEVEL9K_ASDF_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_POSTGRES_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND=5
  ## typeset -g POWERLEVEL9K_ASDF_PHP_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_PHP_SHOW_ON_UPGLOB='*.foo|*.bar'
  #typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=0
  #typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND=3
  ## typeset -g POWERLEVEL9K_ASDF_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ## typeset -g POWERLEVEL9K_ASDF_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

  ##########[ nordvpn: nordvpn connection status, linux only (https://nordvpn.com/) ]###########
  # typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=7
  # typeset -g POWERLEVEL9K_NORDVPN_BACKGROUND=4
  # typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
  # typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
  # typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ ranger: ranger shell (https://github.com/ranger/ranger) ]##################
  # typeset -g POWERLEVEL9K_RANGER_FOREGROUND=3
  # typeset -g POWERLEVEL9K_RANGER_BACKGROUND=0
  # typeset -g POWERLEVEL9K_RANGER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ nnn: nnn shell (https://github.com/jarun/nnn) ]#######################
  # typeset -g POWERLEVEL9K_NNN_FOREGROUND=0
  # typeset -g POWERLEVEL9K_NNN_BACKGROUND=6
  # typeset -g POWERLEVEL9K_NNN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########################[ vim_shell: vim shell indicator (:sh) ]###########################
  # typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=0
  # typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND=2
  # typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######[ midnight_commander: midnight commander shell (https://midnight-commander.org/) ]######
  # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=3
  # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND=0
  # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #[ nix_shell: nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html) ]##
  # typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=0
  # typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND=4
  # typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=
  # typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################################[ disk_usage: disk usage ]##################################
  # typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=3
  # typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=0
  # typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=0
  # typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=3
  # typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=7
  # typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=1
  # typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
  # typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
  # typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
  # typeset -g POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ vi_mode: vi mode (you don't need this if you've enabled prompt_char) ]###########
  #typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND=0
  #typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
  #typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=2
  #typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
  #typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=4
  #typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
  #typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=3
  #typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
  #typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=8

  ######################################[ ram: free RAM ]#######################################
  # typeset -g POWERLEVEL9K_RAM_FOREGROUND=0
  # typeset -g POWERLEVEL9K_RAM_BACKGROUND=3
  # typeset -g POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################################[ swap: used swap ]######################################
  # typeset -g POWERLEVEL9K_SWAP_FOREGROUND=0
  # typeset -g POWERLEVEL9K_SWAP_BACKGROUND=3
  # typeset -g POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################################[ load: CPU load ]######################################
  #typeset -g POWERLEVEL9K_LOAD_WHICH=5
  ## typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=2
  ## typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_LOAD_WARNING_BACKGROUND=3
  ## typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=1
  ## typeset -g POWERLEVEL9K_LOAD_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
  ## typeset -g POWERLEVEL9K_TODO_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_TODO_BACKGROUND=8
  #typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
  #typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false
  ## typeset -g POWERLEVEL9K_TODO_CONTENT_EXPANSION='$P9K_TODO_FILTERED_TASK_COUNT'
  ## typeset -g POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ timewarrior: timewarrior tracking status (https://timewarrior.net/) ]############
  ## typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=255
  ## typeset -g POWERLEVEL9K_TIMEWARRIOR_BACKGROUND=8
  #typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'
  ## typeset -g POWERLEVEL9K_TIMEWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
  # typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=0
  # typeset -g POWERLEVEL9K_TASKWARRIOR_BACKGROUND=6
  # typeset -g POWERLEVEL9K_TASKWARRIOR_CONTENT_EXPANSION='$P9K_TASKWARRIOR_PENDING_COUNT'
  # typeset -g POWERLEVEL9K_TASKWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################################[ context: user@hostname ]##################################
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=3
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=3
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  # typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_CONTEXT_PREFIX='with '

  ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
  # typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=0
  # typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=4
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
  # typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ anaconda: conda environment (https://conda.io/) ]######################
  ## typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND=4
  #typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}'
  ## typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
  ## typeset -g POWERLEVEL9K_PYENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_PYENV_BACKGROUND=4
  #typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true
  #typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_PYENV_PYTHON_VERSION:#$P9K_CONTENT}:+ $P9K_PYENV_PYTHON_VERSION}'
  ## typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
  ## typeset -g POWERLEVEL9K_GOENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_GOENV_BACKGROUND=4
  #typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
  ## typeset -g POWERLEVEL9K_NODENV_FOREGROUND=2
  ## typeset -g POWERLEVEL9K_NODENV_BACKGROUND=0
  #typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
  # typeset -g POWERLEVEL9K_NVM_FOREGROUND=0
  # typeset -g POWERLEVEL9K_NVM_BACKGROUND=5
  # typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
  ## typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=2
  ## typeset -g POWERLEVEL9K_NODEENV_BACKGROUND=0
  #typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
  #typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
  ## typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############################[ node_version: node.js version ]###############################
  ## typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=7
  ## typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=2
  #typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
  ## typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ########################[ go_version: go version (https://golang.org) ]########################
  ## typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=255
  ## typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND=2
  #typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
  ## typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
  ## typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_RUST_VERSION_BACKGROUND=208
  #typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true
  ## typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]################
  ## typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=7
  ## typeset -g POWERLEVEL9K_DOTNET_VERSION_BACKGROUND=5
  #typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true
  ## typeset -g POWERLEVEL9K_DOTNET_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ php_version: php version (https://www.php.net/) ]######################
  #typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=0
  #typeset -g POWERLEVEL9K_PHP_VERSION_BACKGROUND=5
  #typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true
  ## typeset -g POWERLEVEL9K_PHP_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ laravel_version: laravel php framework version (https://laravel.com/) ]###########
  #typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=1
  #typeset -g POWERLEVEL9K_LARAVEL_VERSION_BACKGROUND=7
  ## typeset -g POWERLEVEL9K_LARAVEL_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
  ## typeset -g POWERLEVEL9K_RBENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_RBENV_BACKGROUND=1
  #typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################[ java_version: java version (https://www.java.com/) ]####################
  #typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=1
  #typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=7
  #typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
  #typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false
  ## typeset -g POWERLEVEL9K_JAVA_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###[ package: name@version from package.json (https://docs.npmjs.com/files/package.json) ]####
  # typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=0
  # typeset -g POWERLEVEL9K_PACKAGE_BACKGROUND=6
  # typeset -g POWERLEVEL9K_PACKAGE_CONTENT_EXPANSION='${P9K_PACKAGE_NAME//\%/%%}@${P9K_PACKAGE_VERSION//\%/%%}'
  # typeset -g POWERLEVEL9K_PACKAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ########################[ rvm: ruby version from rvm (https://rvm.io) ]########################
  ## typeset -g POWERLEVEL9K_RVM_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_RVM_BACKGROUND=240
  #typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
  #typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
  ## typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ fvm: flutter version management (https://github.com/leoafarias/fvm) ]############
  # typeset -g POWERLEVEL9K_FVM_FOREGROUND=0
  # typeset -g POWERLEVEL9K_FVM_BACKGROUND=4
  # typeset -g POWERLEVEL9K_FVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
  ## typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_LUAENV_BACKGROUND=4
  #typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
  ## typeset -g POWERLEVEL9K_JENV_FOREGROUND=1
  ## typeset -g POWERLEVEL9K_JENV_BACKGROUND=7
  #typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ plenv: perl version from plenv (https://github.com/tokuhirom/plenv) ]############
  ## typeset -g POWERLEVEL9K_PLENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_PLENV_BACKGROUND=4
  #typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #############[ phpenv: php version from phpenv (https://github.com/phpenv/phpenv) ]############
  ## typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_PHPENV_BACKGROUND=5
  #typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
  #typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
  #typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true
  ## typeset -g POWERLEVEL9K_PHPENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ haskell_stack: haskell version from stack (https://haskellstack.org/) ]###########
  ## typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_HASKELL_STACK_BACKGROUND=3
  #typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
  #typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true
  ## typeset -g POWERLEVEL9K_HASKELL_STACK_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ terraform: terraform workspace (https://www.terraform.io) ]#################
  ##   typeset -g POWERLEVEL9K_TERRAFORM_TEST_FOREGROUND=2
  ##   typeset -g POWERLEVEL9K_TERRAFORM_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ##   typeset -g POWERLEVEL9K_TERRAFORM_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  #typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
  #    # '*prod*'  PROD    # These values are examples that are unlikely
  #    # '*test*'  TEST    # to match your needs. Customize them as needed.
  #    '*'       DEFAULT)
  #typeset -g POWERLEVEL9K_TERRAFORM_DEFAULT_FOREGROUND=4
  #typeset -g POWERLEVEL9K_TERRAFORM_DEFAULT_BACKGROUND=0
  ## typeset -g POWERLEVEL9K_TERRAFORM_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
  #typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito'
  ##   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=0
  ##   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_BACKGROUND=2
  ##   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ##   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  #typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
  #    # '*prod*'  PROD    # These values are examples that are unlikely
  #    # '*test*'  TEST    # to match your needs. Customize them as needed.
  #    '*'       DEFAULT)
  #typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=7
  #typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=5
  ## typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
  #POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
  #POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'


  ##[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
  #typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi'
  ##   typeset -g POWERLEVEL9K_AWS_TEST_FOREGROUND=28
  ##   typeset -g POWERLEVEL9K_AWS_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ##   typeset -g POWERLEVEL9K_AWS_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
  #typeset -g POWERLEVEL9K_AWS_CLASSES=(
  #    # '*prod*'  PROD    # These values are examples that are unlikely
  #    # '*test*'  TEST    # to match your needs. Customize them as needed.
  #    '*'       DEFAULT)
  ## typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=7
  ## typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND=1
  ## typeset -g POWERLEVEL9K_AWS_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #[ aws_eb_env: aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/) ]#
  # typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=2
  # typeset -g POWERLEVEL9K_AWS_EB_ENV_BACKGROUND=0
  # typeset -g POWERLEVEL9K_AWS_EB_ENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ azure: azure account name (https://docs.microsoft.com/en-us/cli/azure) ]##########
  typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi'
  # typeset -g POWERLEVEL9K_AZURE_FOREGROUND=7
  # typeset -g POWERLEVEL9K_AZURE_BACKGROUND=4
  # typeset -g POWERLEVEL9K_AZURE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
  #typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs'
  ## typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=7
  ## typeset -g POWERLEVEL9K_GCLOUD_BACKGROUND=4
  #typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
  #typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'
  #typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60
  ## typeset -g POWERLEVEL9K_GCLOUD_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##[ google_app_cred: google application credentials (https://cloud.google.com/docs/authentication/production) ]#
  #typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi'
  ##   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_FOREGROUND=28
  ##   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  ##   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_CONTENT_EXPANSION='$P9K_GOOGLE_APP_CRED_PROJECT_ID'
  #typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
  #    # '*:*prod*:*'  PROD    # These values are examples that are unlikely
  #    # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
  #    '*'             DEFAULT)
  ## typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=7
  ## typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND=4
  ## typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  #typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

  ###############################[ public_ip: public IP address ]###############################
  # typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=7
  # typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND=0
  # typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #########################[ vpn_ip: virtual private network indicator ]#########################
  ## typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=0
  ## typeset -g POWERLEVEL9K_VPN_IP_BACKGROUND=6
  #typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
  #typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(wg|(.*tun))[0-9]*'
  #typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false
  ## typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ ip: ip address and bandwidth usage for a specified network interface ]###########
  typeset -g POWERLEVEL9K_IP_BACKGROUND=4
  typeset -g POWERLEVEL9K_IP_FOREGROUND=0
  typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='${P9K_IP_RX_RATE:+⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+⇡$P9K_IP_TX_RATE }$P9K_IP_IP'
  typeset -g POWERLEVEL9K_IP_INTERFACE='e.*'
  # typeset -g POWERLEVEL9K_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #########################[ proxy: system-wide http/https/ftp proxy ]##########################
  # typeset -g POWERLEVEL9K_PROXY_FOREGROUND=4
  # typeset -g POWERLEVEL9K_PROXY_BACKGROUND=0
  # typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################################[ battery: internal battery ]#################################
  #typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  #typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=1
  #typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=2
  #typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=3
  #typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
  #typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false
  ## typeset -g POWERLEVEL9K_BATTERY_BACKGROUND=0

  #####################################[ wifi: wifi speed ]#####################################
  # typeset -g POWERLEVEL9K_WIFI_FOREGROUND=0
  # typeset -g POWERLEVEL9K_WIFI_BACKGROUND=4
  # typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ####################################[ time: current time ]####################################
  # typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
  # typeset -g POWERLEVEL9K_TIME_BACKGROUND=7
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
  # typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_TIME_PREFIX='at '

  # function prompt_example() {
  #   p10k segment -b 1 -f 3 -i '⭐' -t 'hello, %n'
  # }
  # function instant_prompt_example() {
  #   prompt_example
  # }
  # typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=3
  # typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
