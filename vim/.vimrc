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

    "TMUX {{{
      call dein#add('christoomey/vim-tmux-navigator')
      call dein#add('tmux-plugins/vim-tmux-focus-events')
      call dein#add('roxma/vim-tmux-clipboard')
      call dein#add('rstacruz/vim-remux')
    "}}}

    "COMPONENTES VISUALES {{{
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
      call dein#add('vim-scripts/ZoomWin')
      call dein#add('mbbill/undotree')
    "}}}

    "BUSQUEDA {{{
      call dein#add('junegunn/fzf.vim')
    "}}}

    "EDICION {{{
      call dein#add('maxbrunsfeld/vim-yankstack')
      call dein#add('nelstrom/vim-visual-star-search')

      call dein#add('kshenoy/vim-signature')
      call dein#add('zhimsel/vim-stay')
      call dein#add('airblade/vim-rooter')
      call dein#add('Konfekt/FastFold')
      call dein#add('Konfekt/FoldText')

      call dein#add('tpope/vim-commentary')
      call dein#add('matze/vim-move')
      call dein#add('tpope/vim-jdaddy')
      call dein#add('tpope/vim-surround')
      call dein#add('wellle/targets.vim')
      call dein#add('michaeljsmith/vim-indent-object')
      " call dein#add('tommcdo/vim-lion')

      call dein#add('prabirshrestha/asyncomplete.vim')
      call dein#add('prabirshrestha/asyncomplete-buffer.vim')
      call dein#add('wellle/tmux-complete.vim')
    "}}}

    "SYNTAX {{{
      call dein#add('elzr/vim-json')
      call dein#add('stephpy/vim-yaml')
      call dein#add('vim-scripts/bash-support.vim')
    "}}}

    "COLORES {{{
      call dein#add('vim-scripts/vim-misc')

      call dein#add('morhetz/gruvbox')
      call dein#add('jnurmine/zenburn')
      call dein#add('AlessandroYorba/Alduin')
      call dein#add('altercation/vim-colors-solarized')
    "}}}

    "OTHER {{{
      call dein#add('prabirshrestha/async.vim')
      call dein#add('machakann/asyncomplete-ezfilter.vim')
    "}}}

    call dein#end()
    call dein#save_state()
  endif
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

    let g:fzf_command_prefix = 'Fzf'
    let g:fzf_buffers_jump = 1
    let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    let g:fzf_history_dir = '~/.cache/fzf-history'

    let g:fastfold_savehook = 0
    let g:move_key_modifier = 'C'

    let g:rooter_targets = '/,*.py,*.java,*.gradle,*.yml'
    let g:rooter_resolve_links = 1

    let g:vim_json_syntax_conceal = 0

    let g:asyncomplete_preprocessor = [function('asyncomplete#preprocessor#ezfilter#filter')]
    let g:asyncomplete#preprocessor#ezfilter#config = {}

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer', 'whitelist': ['*'], 'blacklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ }))
    let g:asyncomplete#preprocessor#ezfilter#config.buffer = {ctx, items -> ctx.osa_filter(items, 1)}

    let g:tmuxcomplete#asyncomplete_source_options = {
      \ 'name': 'tmux', 'whitelist': ['*'],
      \ 'config': {
      \     'splitmode':      'words', 'filter_prefix':   1, 'show_incomplete': 1,
      \     'sort_candidates':      1, 'scrollback':      1, 'truncate':        0
      \     }
      \ }
    let g:asyncomplete#preprocessor#ezfilter#config.tmux = {ctx, items -> ctx.osa_filter(items, 1)}

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

  map <leader>dt           :diffthis<cr>
  map <leader>do           :diffoff<cr>

  nnoremap <leader>b      :FzfBuffers<CR>
  nnoremap <leader>F      :FzfHistory<CR>
  nnoremap <C-p>          :FzfFiles<CR>
  nnoremap <leader>l      :FzfLines<CR>
  nmap <leader><tab>      <plug>(fzf-maps-n)
  xmap <leader><tab>      <plug>(fzf-maps-x)
  omap <leader><tab>      <plug>(fzf-maps-o)

  xnoremap iz             :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
  xnoremap az             :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>]

"}}}

"FUNCIONES {{{
  au VimResized * exe "normal! \<c-w>="

  com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

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
