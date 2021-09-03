if &compatible
  set nocompatible
endif

let $VIMHOME=expand('<sfile>:p:h')
let $TMPPATH=expand($VIMHOME.'/.vim/tmp')
let $UNDOPATH=expand($TMPPATH.'/undo')
let $SWPPATH=expand($TMPPATH.'/swp')
let $BACKUPPATH=expand($TMPPATH.'/backup')

"CONFIGURACION DE DEIN {{{
  let existeDein=1
  let _readme=expand($VIMHOME.'/.vim/bundle/dein.vim/README.md')

  if !filereadable(_readme)
    silent execute "!mkdir ".$VIMHOME."/.vim"
    silent execute "!mkdir ".$TMPPATH
    silent execute "!mkdir ".$UNDOPATH
    silent execute "!mkdir ".$SWPPATH
    silent execute "!mkdir ".$BACKUPPATH

    echo ""
    echo "Instalando dein.."
    echo ""
    echo ""
    silent execute "!mkdir ".$VIMHOME."/.vim/bundle"
    silent execute "!git clone https://github.com/Shougo/dein.vim ".$VIMHOME."/.vim/bundle/dein.vim"
    let existeDein=0
    echo ""
    echo "Ejecuta:  call dein#install()"
    echo ""
    echo ""
  endif

  set runtimepath+=$VIMHOME/.vim/bundle/dein.vim/

  if dein#load_state(expand($VIMHOME.'/.vim/bundle/'))
    call dein#begin(expand($VIMHOME.'/.vim/bundle/'))
    call dein#add('Shougo/dein.vim')

    "SESIONES {{{
      call dein#add('tpope/vim-obsession')
    "}}}

    "TMUX {{{
      call dein#add('christoomey/vim-tmux-navigator')
      call dein#add('tmux-plugins/vim-tmux-focus-events')
      call dein#add('roxma/vim-tmux-clipboard')
      call dein#add('rstacruz/vim-remux')
    "}}}

    "COMPONENTES VISUALES {{{
      call dein#add('drmikehenry/vim-fontsize')
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
      call dein#add('vim-scripts/ZoomWin')
      call dein#add('mbbill/undotree')
      " call dein#add('tpope/vim-fugitive')                   "https://github.com/tpope/vim-fugitive
      " call dein#add('vim-scripts/DirDiff.vim')
      " call dein#add('preservim/nerdtree')
      " call dein#add('jistr/vim-nerdtree-tabs')
      " call dein#add('Xuyuanp/nerdtree-git-plugin')
      " call dein#add('vim-scripts/hexman.vim')
    "}}}

    "BUSQUEDA {{{
      call dein#add('junegunn/fzf.vim')
      " if executable('ctags')
      "   call dein#add('prabirshrestha/asyncomplete-tags.vim')
      "   call dein#add('ludovicchabant/vim-gutentags')
      " endif
      " call dein#add('ctrlpvim/ctrlp.vim')
    "}}}

    "EDICION {{{
      call dein#add('Konfekt/FastFold')
      call dein#add('zhimsel/vim-stay')
      call dein#add('airblade/vim-rooter')
      call dein#add('svermeulen/vim-subversive')
      call dein#add('maxbrunsfeld/vim-yankstack')
      call dein#add('nelstrom/vim-visual-star-search')
      call dein#add('adelarsq/vim-matchit')
      call dein#add('kana/vim-smartinput')
      call dein#add('matze/vim-move')
      call dein#add('tpope/vim-surround')                   "https://github.com/tpope/vim-surround
      call dein#add('wellle/targets.vim')                   "https://github.com/wellle/targets.vim
      call dein#add('michaeljsmith/vim-indent-object')
      call dein#add('tpope/vim-commentary')
      " call dein#add('tommcdo/vim-lion')
      call dein#add('prabirshrestha/asyncomplete.vim')
      call dein#add('prabirshrestha/asyncomplete-buffer.vim')
      " call dein#add('prabirshrestha/asyncomplete-file.vim')
      call dein#add('wellle/tmux-complete.vim')
      call dein#add('SirVer/ultisnips')
      call dein#add('honza/vim-snippets')
      call dein#add('prabirshrestha/asyncomplete-ultisnips.vim')
      call dein#add('mogelbrod/vim-jsonpath')
      call dein#add('hjson/vim-hjson')
    "}}}

    "SYNTAX {{{
      call dein#add('sheerun/vim-polyglot')
      call dein#add('prabirshrestha/asyncomplete-lsp.vim')
      call dein#add('mattn/vim-lsp-settings')
      call dein#add('prabirshrestha/vim-lsp')
      call dein#add('tmux-plugins/vim-tmux')
      call dein#add('pearofducks/ansible-vim')              "https://github.com/pearofducks/ansible-vim
      call dein#add('ekalinin/Dockerfile.vim')
      call dein#add('elzr/vim-json')
      call dein#add('stephpy/vim-yaml')
      call dein#add('vim-scripts/indentpython.vim')
      call dein#add('vim-scripts/bash-support.vim')
      call dein#add('plasticboy/vim-markdown')
      " call dein#add('tfnico/vim-gradle')
      " call dein#add('godlygeek/tabular')
      " call dein#add('vim-scripts/autoit.vim')
      " call dein#add('PProvost/vim-ps1')
    "}}}

    "COLORES {{{
      call dein#add('vim-scripts/vim-misc')
      call dein#add('vim-scripts/vim-colorscheme-SWITcher')

      call dein#add('ayu-theme/ayu-vim')
      call dein#add('morhetz/gruvbox')
      call dein#add('nanotech/jellybeans.vim')
      call dein#add('croaker/mustang-vim')
      call dein#add('arcticicestudio/nord-vim')
      call dein#add('NLKNguyen/papercolor-theme')
      call dein#add('jnurmine/zenburn')
      call dein#add('zefei/simple-dark')
      call dein#add('cocopon/iceberg.vim')
      call dein#add('danilo-augusto/vim-afterglow')
      call dein#add('AlessandroYorba/Alduin')
      call dein#add('iojani/silenthill.vim')
      call dein#add('altercation/vim-colors-solarized')
      call dein#add('Resonious/vim-camo')
    "}}}

    "OTHER {{{
      call dein#add('b4b4r07/vim-ansible-vault')
      call dein#add('prabirshrestha/async.vim')
      call dein#add('machakann/asyncomplete-ezfilter.vim')
      " call dein#add('tpope/vim-dispatch')
      " call dein#add('jmcantrell/vim-virtualenv')
      " call dein#add('vimwiki/vimwiki')
    "}}}

    call dein#end()
    call dein#save_state()
  endif
"}}}

"TIPOS DE ARCHIVO  {{{
  " autocmd BufNewFile,BufRead *.gradle set filetype=groovy

  autocmd BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
  autocmd BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
  autocmd BufRead vault.yml :AnsibleVaultDecrypt
  autocmd BufWrite vault.yml :AnsibleVaultEncrypt
"}}}

"CONFIGURACIÓN BASICA {{{
  filetype plugin indent on
  syntax enable
  syntax on                      " Habilita el resaltado de sintaxis.
  set background=dark            " Establece el fondo oscuro.

  scriptencoding utf-8
  colorscheme alduin              " default colorscheme
  set encoding=utf-8              " Establece la codificación a UTF-8.
  set relativenumber              " Display relative line numbers
  set number                      " display the absolute line number at the line you're on
  set ls=2                        " Linea de estado siempre visible.
  set t_Co=256                    " Habilita 256 colores en modo consola.
  set visualbell
  set viewoptions=cursor,folds,slash,unix

  set rtp+=~/.config/fzf

  if has("gui_running")
    set go-=T                     " Elimina la barra de herramientas.
    set go-=e
    set go-=m
    set guifont=Inconsolata\ 12
    set guitablabel=%M\ %t
  endif

  set cursorline                  " Resalta la linea bajo el cursor.
  set cursorcolumn                " Resalta la columna bajo el cursor.
  set fillchars+=vert:¦           " Mejora aspecto de la división de ventanas.
  set ttyfast                     " Mejora el redibujado de la pantalla.
  set showcmd                     " Muestra comandos incompletos.
  set hidden                      " Oculta los bufferes cerrados.
  set lazyredraw                  " Redibuja solo cuando es necesario.
  set autoread                    " Actualiza cambios realizados fuera de vim.
  set ttimeoutlen=0               " Conmuta instantaneamente entre modos

  set noshowmode
  set wildmode=longest:list,full  " Comportamiento de autocompletar
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  set incsearch                   " Búsqueda incremental.
  set showmatch                   " Muestra la pareja de paréntesis.
  set hlsearch                    " Resultados de búsquela resaltados.
  set ignorecase                  " No distingue entre mayúsculas y minúsculas.
  set smartcase                   " Distinción mayúsculas/minúsculas inteligente.
  set complete=.,w,b,t

  set undofile
  set backup
  set history=1000
  set undoreload=1000
  set undodir=$UNDOPATH//
  set directory=$SWPPATH//
  set backupdir=$BACKUPPATH//

  set expandtab                  " Emplea espacios en vez de tabulados.
  set tabstop=4                  " Un Tabulado son cuatro espacios.
  set shiftwidth=2               " Numero de espacios para autoindentado.
  set softtabstop=4              " Un Tabulado de cuatro espacios.
  set autoindent                 " Establece el autoindentado.
  set scrolloff=4
  set foldmethod=indent

  set nu
  set listchars=tab:?\ ,eol:?,trail:·,extends:?,precedes:?
  set splitbelow
  set splitright

  set completeopt=menuone,preview
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j
  endif
"}}}

"CONFIGURACIÓN DE PLUGINS {{{
  if existeDein == 1

    let g:tmux_navigator_no_mappings = 1
    let g:remux_key = '<C-t>'

    let g:airline_theme='distinguished'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

    let g:bufferline_echo = 0

    let g:asyncomplete_auto_completeopt = 1

    let g:asyncomplete_auto_popup = 1
    let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')

    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_signs_error = {'text': '✗'}
    let g:lsp_signs_warning = {'text': '‼'}
    let g:lsp_signs_hint = {'text': '>>'}
    let g:lsp_log_verbose = 1
    let g:lsp_log_file = expand('/tmp/vim-lsp.log')

    let g:fzf_command_prefix = 'Fzf'
    let g:fzf_buffers_jump = 1
    let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'
    " if exists('$TMUX')
    "   let g:fzf_layout = { 'tmux': '-p90%,60%' }
    " else
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    " endif
    let g:fzf_history_dir = '~/.cache/fzf-history'

    " let g:ctrlp_map = '<c-p>'
    " let g:ctrlp_cmd = 'CtrlPMixed'
    " let g:ctrlp_working_path_mode = 'ra'
    " let g:ctrlp_switch_buffer = 'et'
    " let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    " let g:ctrlp_custom_ignore = {
    "   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    "   \ 'file': '\v\.(exe|so|dll)$',
    "   \ 'link': 'some_bad_symbolic_links',
    "   \ }

    " let g:nerdtree_tabs_open_on_gui_startup = 0
    " let g:nerdtree_tabs_open_on_console_startup = 0
    " let g:nerdtree_tabs_autofind = 1
    " let NERDTreeShowBookmarks=1
    " let NERDTreeShowHidden=1
    " let NERDTreeMinimalUI = 1
    " let NERDTreeDirArrows = 1
    " let NERDTreeAutoDeleteBuffer = 1
    " let g:NERDTreeUpdateOnCursorHold = 0
    " let g:NERDTreeIndicatorMapCustom = {
    "   \ 'Modified'  : '✹', 'Staged'    : '✚', 'Untracked" : '✭', 'Renamed'   : '➜',
    "   \ 'Unmerged'  : '═', 'Deleted'   : '✖', 'Dirty"     : '✗', 'Clean'     : '✔︎',
    "   \ 'Ignored'   : '☒', 'Unknown'   : '?' }

    let g:fastfold_savehook = 0
    let g:fastfold_minlines = 0
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk]']

    let g:move_key_modifier = 'C'

    let g:rooter_targets = '/,*.py,*.java,*.gradle,*.yml'
    let g:rooter_resolve_links = 1

    let g:DirDiffExcludes = ".git,*.class,*.exe,.*.swp"

    let g:vim_json_syntax_conceal = 0

    if has("gui_running")
      let g:fontsize#timeout = 1
      let g:fontsize#timeoutlen = 3000
    endif

    let g:asyncomplete_preprocessor = [function('asyncomplete#preprocessor#ezfilter#filter')]
    let g:asyncomplete#preprocessor#ezfilter#config = {}

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer', 'whitelist': ['*'], 'blacklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ }))
    let g:asyncomplete#preprocessor#ezfilter#config.buffer = {ctx, items -> ctx.osa_filter(items, 1)}

    " au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    "   \ 'name': 'file', 'whitelist': ['*'],
    "   \ 'completor': function('asyncomplete#sources#file#completor'),
    "   \ }))
    " let g:asyncomplete#preprocessor#ezfilter#config.file = {ctx, items -> ctx.osa_filter(items, 1)}

    let g:tmuxcomplete#asyncomplete_source_options = {
      \ 'name': 'tmux', 'whitelist': ['*'],
      \ 'config': {
      \     'splitmode':      'words', 'filter_prefix':   1, 'show_incomplete': 1,
      \     'sort_candidates':      1, 'scrollback':      1, 'truncate':        0
      \     }
      \ }
    let g:asyncomplete#preprocessor#ezfilter#config.tmux = {ctx, items -> ctx.osa_filter(items, 1)}

    " if executable('ctags')
    "   au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    "     \ 'name': 'tags', 'whitelist': ['*'], 'blacklist': ['python', 'vim', 'ansible', 'yaml'],
    "     \ 'completor': function('asyncomplete#sources#tags#completor'),
    "     \ }))
    "   let g:asyncomplete#preprocessor#ezfilter#config.tags = {ctx, items -> ctx.osa_filter(items, 1)}
    " endif

    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
      \ 'name': 'snip', 'whitelist': ['*'],
      \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
      \ }))

    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    let g:ansible_unindent_after_newline = 1
    let g:ansible_yamlKeyName = 'yamlKey'
    let g:ansible_attribute_highlight = "ob"
    let g:ansible_name_highlight = 'd'
    let g:ansible_extra_keywords_highlight = 1
    let g:ansible_normal_keywords_highlight = 'Constant'
    let g:ansible_with_keywords_highlight = 'Constant'
    let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
    let g:ansible_goto_role_paths = './roles,../_common/roles'

  endif
"}}}

"COMANDOS Y TECLAS {{{
  let mapleader = "\<space>"
  let g:mapleader = "\<space>"

  nmap <leader>n          :set relativenumber!<CR>
  nmap <leader>p          <Plug>yankstack_substitute_older_paste
  nmap <leader>P          <Plug>yankstack_substitute_newer_paste
  map <leader><cr>        :noh<cr>                                  " Disable highlight
  map <leader>cd          :cd %:p:h<cr>:pwd<cr>                     " Switch CWD to the directory of the open buffer
  map <leader>h           :cd<cr>                                   " Switch CWD to $home directory
  map <leader>f           :ZoomWin<CR>
  map <leader>j           :%!jq '.'<cr>
  map <leader>x           :FormatXML<Cr>
  nnoremap <leader>v      <C-v>
  nnoremap <leader>u      :UndotreeToggle<CR>
  nnoremap <leader>z      :set invpaste paste?<CR>
  nnoremap <Leader>H      :call<SID>LongLineHLToggle()<cr>
  nnoremap <leader>ie     :exec "normal! ggVG"<cr>

  xnoremap "+y y:call system("wl-copy", @")<cr>
  nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

  nnoremap <C-M-V>        "+gP
  inoremap <C-M-V>        <C-R>+
  cnoremap <C-M-V>        <C-R>+
  vmap <C-c>              "+yi
  vmap <C-x>              "+c
  vmap <C-v>              c<ESC>"+p
  imap <C-v>              <C-r><C-o>+

  nnoremap <C-n>          :bnext<CR>
  nnoremap <C-m>          :bprevious<CR>

  vnoremap <silent> *     :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
  vnoremap <silent> #     :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
  cmap w!!                w !sudo tee >/dev/null %
  cnoremap <expr> %%      getcmdtype() == ':' ? expand('%:h').'/' : '%%'

  nnoremap <C-w>k         :TmuxNavigateUp<CR>
  nnoremap <C-w>j         :TmuxNavigateDown<CR>
  nnoremap <C-w>h         :TmuxNavigateLeft<CR>
  nnoremap <C-w>l         :TmuxNavigateRight<CR>

  
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : asyncomplete#force_refresh()
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <expr><cr>     pumvisible() ? "\<C-y>" : "\<cr>"
  imap <c-space>          <Plug>(asyncomplete_force_refresh)

  map <S-M-r>             :LspRename<cr>
  map <M-r>               :LspReferences<cr>
  map <M-d>               :LspDefinition<cr>
  map <M-e>               :LspNextError<cr>
  map <M-w>               :LspNextWarning<cr>
  map <S-M-e>             :LspPreviousError<cr>
  map <S-M-w>             :LspPreviousWarning<cr>
  map <leader>dt           :diffthis<cr>
  map <leader>do           :diffoff<cr>

  nnoremap <leader>b      :FzfBuffers<CR>
  nnoremap <leader>F      :FzfHistory<CR>
  nnoremap <C-p>          :FzfFiles<CR>
  nnoremap <leader>l      :FzfLines<CR>
  nmap <leader><tab>      <plug>(fzf-maps-n)
  xmap <leader><tab>      <plug>(fzf-maps-x)
  omap <leader><tab>      <plug>(fzf-maps-o)

  nmap sp                  <plug>(SubversiveSubstitute)
  nmap ss                 <plug>(SubversiveSubstituteLine)
   nmap sP                  <plug>(SubversiveSubstituteToEndOfLine)
  nmap <leader>s          <plug>(SubversiveSubstituteRange)
  xmap <leader>s          <plug>(SubversiveSubstituteRange)
  nmap <leader>ss         <plug>(SubversiveSubstituteWordRange)
  nmap <leader>cs         <plug>(SubversiveSubstituteRangeConfirm)
  xmap <leader>cs         <plug>(SubversiveSubstituteRangeConfirm)
  nmap <leader>css        <plug>(SubversiveSubstituteWordRangeConfirm)

  xnoremap iz             :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
  xnoremap az             :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>]

  " silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
  " nnoremap <silent> <Plug>SurroundWordWithApostrophe  viw<esc>a'<esc>hbi'<esc>lel
  "   \ :call repeat#set("\<Plug>SurroundWordWithApostrophe", v:count)<cr>
  " nmap <Leader>'  <Plug>SurroundWordWithApostrophe

  " nnoremap <leader>t      :NERDTreeTabsToggle<CR>
  " map <F6>                <Plug>HexManager<CR>
  " nnoremap <F9>           :Dispatch<CR>
  map <leader>g           :Obsession .
  nnoremap <leader>x      :AnsibleVaultDecrypt<CR>
  nnoremap <leader>X      :AnsibleVaultEncrypt<CR>
  nnoremap <leader>gr     :call FindAnsibleRoleUnderCursor()<CR>
  vnoremap <leader>gr     :call FindAnsibleRoleUnderCursor()<CR>

  if has("gui_running")
    nmap <silent> <Leader>+  <Plug>FontsizeInc
    nmap <silent> <Leader>-  <Plug>FontsizeDec
    nmap <silent> <Leader>=  <Plug>FontsizeDefault
  endif

"}}}

"FUNCIONES {{{
  au VimResized * exe "normal! \<c-w>="

  com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  endfunction

  augroup lsp_install
      au!
      autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END

  hi OverLength ctermbg=none cterm=none
  match OverLength /\%>80v/
  fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
      let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
      echo "Long lines highlighted"
    else
      call matchdelete(w:longlinehl)
      unl w:longlinehl
      echo "Long lines unhighlighted"
    endif
  endfunction

  function! FindAnsibleRoleUnderCursor()
    if exists("g:ansible_goto_role_paths")
      let l:role_paths = g:ansible_goto_role_paths
    else
      let l:role_paths = "./roles"
    endif
    let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
    let l:found_role_path = findfile(l:tasks_main, l:role_paths)
    if l:found_role_path == ""
      echo l:tasks_main . " not found"
    else
      execute "edit " . fnameescape(l:found_role_path)
    endif
  endfunction
"}}}
