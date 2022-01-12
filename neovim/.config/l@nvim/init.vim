if has('vim_starting')
  exe 'set encoding=utf-8'
  scriptencoding utf-8
  if &compatible
    set nocompatible
  endif
endif

"Paths {{{
  let $undodir=expand(stdpath('cache').'/undo')
  let $swpdir=expand(stdpath('cache').'/swp')
  let $bkdir=expand(stdpath('cache').'/backup')

  silent execute "!mkdir -p ".$undodir
  silent execute "!mkdir -p ".$swpdir
  silent execute "!mkdir -p ".$bkdir
"}}}

"Plugins {{{
  "Plugin manager {{{
    let $autoload = stdpath('data').'/site/autoload/plug.vim'
    if empty(glob($autoload))
      let $plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      silent execute '!curl -fLo '.$autoload.' --create-dirs '.$plugurl
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin(stdpath('data').'/plug')
    " Plug 'junegunn/vim-plug'
  "}}}

  "Libraries {{{
    Plug 'nvim-lua/plenary.nvim'                                               "Lua libraries (2)
    Plug 'kyazdani42/nvim-web-devicons'                                        "Lua libraries (3)
    Plug 'tami5/sqlite.lua'                                                    "Lua libraries (4)
    Plug 'rktjmp/lush.nvim'                                                    "Colorscheme Lua lib (5)
    Plug 'tpope/vim-dotenv'                                                    "Load environment vars (6)
  "}}}

  "Visual {{{
    Plug 'famiu/bufdelete.nvim', { 'on': ['Bdelete', 'Bwipeout'] }             "Close buffer without changing layout
    Plug 'drmikehenry/vim-fontsize', !empty($NVIM_GUI) ? {} : { 'on': [] }     "Change GUI font size
    Plug 'troydm/zoomwintab.vim'                                               "Maximize window
    Plug 'akinsho/bufferline.nvim'                                             "Information on buffer line
    Plug 'Konfekt/FastFold'                                                    "Simplify folding and unfolding blocks
    Plug 'Konfekt/FoldText'                                                    "Show info on folded blocks

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'AlessandroYorba/Alduin'
    Plug 'jnurmine/zenburn'
    Plug 'ellisonleao/gruvbox.nvim'                                            "(5) TreeSitter & startify support
    Plug 'ishan9299/nvim-solarized-lua'
  "}}}

  "Navigation {{{
    Plug 'nacro90/numb.nvim'                                                   "Previews destination line on jump
    Plug 'machakann/vim-highlightedyank'                                       "Highlight yakend text
    Plug 'bronson/vim-visual-star-search'                                      "Find text under cursor by pressing *
    Plug 'kshenoy/vim-signature'                                               "Show and manipulate marks
    Plug 'zhimsel/vim-stay'                                                    "Keeps last view of buffer/file
    Plug 'lukas-reineke/indent-blankline.nvim'                                 "Indent lines properly
  "}}}

  "Motions & Objects {{{
    Plug 'tpope/vim-commentary'                                                "Comment using motions
    Plug 'matze/vim-move'                                                      "Move lines or selected blocks
    Plug 'tpope/vim-surround'                                                  "Bracket objects
    Plug 'wellle/targets.vim'                                                  "Text objects
    Plug 'tommcdo/vim-lion'                                                    "Text alignment based on char
    Plug 'tpope/vim-jdaddy'                                                    "Json!
  "}}}

  "Telescope {{{
    Plug 'nvim-telescope/telescope.nvim'                                       "(2) search popups!
    Plug 'nvim-telescope/telescope-file-browser.nvim'                          "
    Plug 'nvim-telescope/telescope-frecency.nvim'                              "(4)
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }          "
    Plug 'cljoly/telescope-repo.nvim'                                          "(2) Jump to any repo
    Plug 'AckslD/nvim-neoclip.lua'                                             "(4)
  "}}}

  "Treesitter {{{
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }              "Syntax based on code tree
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'                         "Syntax related objects
    Plug 'nvim-treesitter/nvim-treesitter-refactor'                            "Highlight and navigate based on treesitter
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'                         "Change commentstring based on treesitter
    Plug 'romgrk/nvim-treesitter-context'                                      "Show cursor context
    Plug 'haringsrob/nvim_context_vt'                                          "Shows context on code blocks
    Plug 'p00f/nvim-ts-rainbow'                                                "Multi color parentheses
    Plug 'folke/twilight.nvim'                                                 "Dimm inactive code blocks
  "}}}

  "LSP {{{
    Plug 'neovim/nvim-lspconfig'                                               "LSP support
    Plug 'williamboman/nvim-lsp-installer'                                     "Commands to install LSP servers
    Plug 'ray-x/lsp_signature.nvim'                                            "Show signature helper on autocomplete
  "}}}

  "CMP {{{
    Plug 'hrsh7th/nvim-cmp'                                                    "Autocomplete engine
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'onsails/lspkind-nvim'                                                "Autocomplete icons
    Plug 'andersevenrud/cmp-tmux', !empty($NVIM_TMUX) ? {} : { 'on': [] }      "Autocomplete for tmux
    Plug 'windwp/nvim-autopairs'                                               "Autocomplete on bracket-type chars
  "}}}

  "Sessions {{{
    Plug 'rmagatti/auto-session'                                               "Autosave sessions per folder
    Plug 'rmagatti/session-lens'                                               "Integrate auto-session with Telescope
  "}}}

  "TMUX {{{
    Plug 'christoomey/vim-tmux-navigator'                                      "Navigate between tmux & vim panels
    Plug 'roxma/vim-tmux-clipboard', !empty($NVIM_TMUX) ? {} : { 'on': [] }    "Share yank/clipboard between tmux & vim
  "}}}

  "Database {{{
    Plug 'tpope/vim-dadbod', { 'on': 'DBUIToggle' }                            "(6) DB connector
    Plug 'kristijanhusak/vim-dadbod-ui', { 'on': 'DBUIToggle' }                "Simple UI for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUIToggle' }        "Autocomplete for dadbod
  "}}}

  "Hops {{{
    Plug 'phaazon/hop.nvim'                                                    "Hop motions
    Plug 'mfussenegger/nvim-ts-hint-textobject'                                "Hops based on Treesitter
  "}}}

  "VimWiki {{{
    Plug 'vimwiki/vimwiki'                                                     "Wiki
    Plug 'tools-life/taskwiki'                                                 "Taskwarrior integration
  "}}}

  "Other {{{
    Plug 'mhinz/vim-startify'                                                  "Start screen
    Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermRepl'] }    "Terminal
    Plug 'lambdalisue/suda.vim', { 'on': ['SudaRead', 'SudaWrite'] }           "Open/Save file as root
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                         "Edit history on current buffer
    Plug 'lewis6991/gitsigns.nvim'                                             "(2) Git visual tools
  "}}}

  call plug#end()
"}}}

"LUA config {{{
  lua require('config')
"}}}

"Functions {{{

  function! s:gitModified()
      let files = systemlist('git ls-files -m 2>/dev/null')
      return map(files, "{'line': v:val, 'path': v:val}")
  endfunction
  function! s:gitUntracked()
      let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
      return map(files, "{'line': v:val, 'path': v:val}")
  endfunction

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
"}}}

"Params {{{

  "General config {{{
    filetype plugin indent on
    syntax enable

    syntax on
    set ruler
    set relativenumber                       "Line numbers are relative
    set number                               "Display the absolute line number at the line you're on
    set ls=2                                 "Always show status bar
    set t_Co=256                             "256 colors on console
    if (has("termguicolors"))
      set termguicolors
      hi LineNr ctermbg=NONE guibg=NONE
    endif
    set visualbell
    set viewoptions=cursor,folds,slash,unix

    colorscheme gruvbox
    set background=dark

    set cursorline
    set cursorcolumn
    set fillchars+=vert:¦                    "Improve tile division look
    set ttyfast                              "Improve screen redrawing
    set hidden                               "Hidde closed buffers
    set autoread                             "Read external changes on open files
    set ttimeoutlen=0                        "No delay between modes
    set noshowmode
    set clipboard=unnamed
    set wildmode=longest:list,full           "Autocomplete behaviour
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    set incsearch                            "Incremental search
    set showmatch                            "Show matching bracket of cursor position
    set hlsearch                             "Show search results
    set smartcase
    set complete=.,w,b,t

    set completeopt=menuone,noselect
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()

    set undofile
    set backup
    set history=1000
    set undoreload=1000
    set undodir=$undodir//
    set directory=$swpdir//
    set backupdir=$bkdir//

    set expandtab                            "Replace \t with whitespaces
    set tabstop=4                            "# of whitespaces per \t
    set shiftwidth=2                         "# of whitespaces per indent level
    set softtabstop=4                        "# of whitespaces per \t
    set autoindent
    set scrolloff=4
    set nu
    set showbreak=↪\
    set listchars=tab:→\ ,eol:↲,trail:•,extends:»,precedes:«,nbsp:‡
    set splitbelow
    set splitright
    set formatoptions+=j
  "}}}

  "Plugin config {{{

    "Visual {{{
      let g:airline_theme                      = 'distinguished'
      let g:airline#extensions#tabline#enabled = 0
      let g:airline_powerline_fonts            = 1
      let g:airline_section_x                  = '[%{&filetype}]'
    "}}}

    "Navigation {{{
      let g:fastfold_savehook                               = 0

      let g:indent_blankline_space_char                     = '.'
      let g:indent_blankline_char                           = '|'
      let g:indent_blankline_show_end_of_line               = v:true
      let g:indent_blankline_show_trailing_blankline_indent = v:true
      let g:indent_blankline_show_foldtext                  = v:true
      let g:indent_blankline_use_treesitter                 = v:true
      let g:indent_blankline_show_current_context           = v:true
      let g:indent_blankline_context_patterns               = ['class', 'function', 'method', '^if', '^for']
      let g:indent_blankline_buftype_exclude                = ['terminal']
    "}}}

    "Motions & Objects {{{
      let g:move_key_modifier           = 'C'
      let g:wordmotion_uppercase_spaces = ['-']

      let b:lion_squeeze_spaces         = 1
      let g:lion_squeeze_spaces         = 1
      let g:lion_map_right              = '<M-t>l'
      let g:lion_map_left               = '<M-t>h'
    "}}}

    "Terminal {{{
      let g:floaterm_keymap_toggle = '<C-M-t>'
      let g:floaterm_keymap_next   = '<C-M-n>'
      let g:floaterm_keymap_prev   = '<C-M-m>'
      let g:floaterm_width         = 0.8
      let g:floaterm_height        = 0.8
      let g:floaterm_opener        = 'edit'
      let g:floaterm_autoclose     = 1
      let g:floaterm_repl_runner   = expand(stdpath('config').'/repl-runner.sh')
      hi FloatermNC guibg          = gray
    "}}}

    "TMUX {{{
      let g:tmux_navigator_no_mappings = 1
    "}}}

    "Database {{{
      let g:db_ui_show_help                  = 0
      let g:db_ui_disable_mappings           = 1
      let g:db_ui_dotenv_variable_prefix     = 'DATABASE_'
      let g:db_ui_save_location              = expand(stdpath('data').'/dadbod-ui')
      let g:db_ui_auto_execute_table_helpers = 1

      autocmd FileType dbui nmap <buffer> <Enter> <Plug>(DBUI_SelectLine)
      autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine)
      autocmd FileType dbui nmap <buffer> R <Plug>(DBUI_Redraw)
      autocmd FileType dbui nmap <buffer> W <Plug>(DBUI_SaveQuery)
      autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
    "}}}

    "Other {{{
      let g:startify_lists = [
              \ { 'type': 'files',                    'header': ['   MRU']            },
              \ { 'type': 'sessions',                 'header': ['   Sessions']      },
              \ { 'type': 'bookmarks',                'header': ['   Bookmarks']      },
              \ { 'type': function('s:gitModified'),  'header': ['   git modified']   },
              \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']  },
              \ { 'type': 'commands',                 'header': ['   Commands']       },
              \ ]
      let g:startify_session_dir = expand(stdpath('data').'/sessions')

      let g:suda_smart_edit        = 1
    "}}}

  "}}}
"}}}

"Shortcuts {{{
  let mapleader = "\<SPACE>"
  let g:mapleader = "\<SPACE>"

  cnoremap <EXPR> %%       getcmdtype() == ':' ? expand('%:h').'/' : '%%'         "Expand HOME path on command
  inoremap <EXPR><TAB>     pumvisible() ? "\<C-n>" : "\<TAB>"|                    "
  inoremap <EXPR><S-TAB>   pumvisible() ? "\<C-p>" : "\<S-TAB>"|                  "
  nnoremap <C-M-V>         "+gP|                                                  "
  inoremap <C-M-V>         <C-R>+|                                                "
  cnoremap <C-M-V>         <C-R>+|                                                "Copy & Paste
  vmap     <C-c>           "+yi|                                                  "shortcuts
  xnoremap "+y             y:call system("wl-copy", @")<CR>|                      "

  cmap w!!                 SudaWrite|                                             "Write as root
  cmap e!!                 SudaRead|                                              "Read as root

  nnoremap <leader>h       <cmd>cd<CR>|                                           "Switch CWD to $home directory
  nnoremap <leader>cwd     <cmd>cd %:p:h<CR>:pwd<CR>|                             "Switch CWD to the directory of the open buffer

  onoremap ie              <cmd>exec "normal! ggVG"<CR>|                          "Text object for whole buffer
  onoremap iv              <cmd>exec "normal! HVL"<CR>|                           "Text object for whole view
  xnoremap iz              <cmd>FastFoldUpdate<CR><ESC>:<C-u>normal! ]zv[z<CR>|   "Text object for inside fold
  xnoremap az              <cmd>FastFoldUpdate<CR><ESC>:<C-u>normal! ]zV[z<CR>]|   "Text object for arround fold
  xnoremap ih              <cmd>lua require('gitsigns').select_hunk()<CR>|        "Text object for inside hunk (git mod.)
  onoremap ih              <cmd>lua require('gitsigns').select_hunk()<CR>|        "Text object for inside hunk (git mod.)
  " onoremap [iIaA] [nl_] (){}B[]<>t'`",.;:+-=~_*#/|\&$a Text objects for any of those (t=tag, a=argument)
  " onoremap [ia]j          Text objects for Json

  nnoremap <C-a>           <cmd>exec "normal! ggVG"<CR>|                          "Select all text in buffer
  nnoremap <C-n>           <cmd>bnext<CR>|                                        "Focus next buffer
  nnoremap <C-m>           <cmd>bprevious<CR>|                                    "Focus previous buffer
  nnoremap <C-w>f          <cmd>ZoomWinTabToggle<CR>|                             "Get current focus full-size
  nnoremap <C-w>k          <cmd>TmuxNavigateUp<CR>|                               "TMUX
  nnoremap <C-w>j          <cmd>TmuxNavigateDown<CR>|                             "
  nnoremap <C-w>h          <cmd>TmuxNavigateLeft<CR>|                             "
  nnoremap <C-w>l          <cmd>TmuxNavigateRight<CR>|                            "

  nmap     <leader>R       <cmd>source $MYVIMRC<CR>|                              "Reload config

  nnoremap <leader>v       <C-v>|                                                 "Cursor visual mode

  nnoremap <leader>ip      <cmd>set invpaste paste?<CR>|                          "Toggle paste modes
  nmap     <leader>lc      <cmd>IndentBlanklineToggle<CR>|                        "Show empty lines as they were indented
  nnoremap <leader>ln      <cmd>set relativenumber!<CR>|                          "Toggle line numbers relative/absolute
  nnoremap <leader>lh      <cmd>call<SID>LongLineHLToggle()<CR>|                  "Highlight text above col 80
  nnoremap <leader>lb      <cmd>lua require"gitsigns".toggle_current_line_blame()<CR>|
  nnoremap <leader>lt      <cmd>Twilight<CR>|                                     "Twilight inactive code blocks

  nnoremap <leader>dt      <cmd>diffthis<CR>|                                     "Activate diff on buffer
  nnoremap <leader>do      <cmd>diffoff<CR>|                                      "Deactivate diff on buffer

  nnoremap <leader>s       <cmd>Telescope session-lens search_session<CR>|        "List of saved sessions
  nnoremap <leader>u       <cmd>UndotreeToggle<CR>|                               "Open change history for buffer
  nnoremap <leader>p       <cmd>Telescope neoclip<CR>|                            "Yank stack
  nnoremap <leader>"       <cmd>Telescope registers theme=get_dropdown<CR>|       "List of registers
  nnoremap <leader>:       <cmd>Telescope command_history theme=get_dropdown<CR>| "List of executed commands
  nnoremap <leader>/       <cmd>Telescope search_history theme=get_dropdown<CR>|  "List of executed searches
  nnoremap <leader><TAB>   <cmd>Telescope commands<CR>|                           "List of possible commands
  nnoremap <leader><S-TAB> <cmd>Telescope keymaps<CR>|                            "List of possible shortcuts
  nnoremap <leader><M-TAB> <cmd>Telescope help_tags<CR>|                          "List of help topics
  nnoremap <leader>fb      <cmd>Telescope buffers theme=get_dropdown layout_config.width=0. layout_config.height=0.2<CR>
  nnoremap <leader>fl      <cmd>Telescope current_buffer_fuzzy_find<CR>|          "
  nnoremap <leader>fh      <Cmd>lua require('telescope').extensions.frecency.frecency()<CR>|
  nnoremap <leader>ff      <cmd>FloatermNew broot<CR>|                            "Open files
  nnoremap <leader>fF      <cmd>Telescope file_browser<CR>|                       "Open files
  nnoremap <leader>fif     <cmd>Telescope live_grep<CR>|                          "
  nnoremap <leader>F       <cmd>Telescope builtin theme=get_dropdown layout_config.height=085 previewer=false<CR>

  nnoremap <leader>gc      <cmd>Telescope git_commits<CR>|                        "List of repository commits
  nnoremap <leader>gC      <cmd>Telescope git_bcommits<CR>|                       "List of file commits
  nnoremap <leader>gst     <cmd>Telescope git_status theme=get_dropdown layout_config.height=0.2<CR>
  nnoremap <leader>gR      <cmd>Telescope repo list<CR>|                          "List system repositories

  nnoremap <leader>wr      <cmd>Telescope lsp_references theme=get_dropdown<CR>|  "LSP references inside file
  nnoremap <leader>wi      <cmd>Telescope treesitter<CR>|                         "Treesitter references inside file
  nnoremap <leader>ws      <cmd>Telescope lsp_document_symbols<CR>|               "LSP symbols inside file
  nnoremap <leader>wd      <cmd>Telescope diagnostics theme=get_dropdown layout_config.width=0.7<CR>

  nnoremap <leader>t       <cmd>FloatermNew<CR>|                                  "Open terminals
  vnoremap <leader>t       :FloatermNew<CR>|                                      "
  nnoremap <leader>tp      <cmd>FloatermNew python<CR>|                           "
  vnoremap <leader>tp      :FloatermNew python<CR>|                               "
  nnoremap <leader>tb      <cmd>FloatermNew bpytop<CR>|                           "
  nnoremap <leader>tg      <cmd>FloatermNew lazygit<CR>|                          "

  nnoremap <leader>bd      <cmd>DBUIToggle<CR>|                                   "Activate/deactivate DB-UI
  vnoremap <leader><ENTER> :DB<CR>|                                               "Execute query

  nnoremap <leader>x       <cmd>FormatXML<CR>|                                    "Format as XML
  nnoremap <leader>j       <cmd>%!jq '.'<CR>|                                     "Format as json
  " nmap gqaj             Pretifies JSON under cursor
  " nmap gwaj             Takes the JSON object on the clipboard and extends it into the JSON object under the cursor.

  nnoremap <leader>hw      <cmd>HopWord<CR>|                                      "Hop!
  nnoremap <leader>hp      <cmd>HopPattern<CR>|                                   "
  omap     <silent>m       :<C-U>lua require('tsht').nodes()<CR>|                 "Treesitter hop!
  vnoremap <silent>m       :lua require('tsht').nodes()<CR>|                      "

  nnoremap <M-g>s          <cmd>lua require"gitsigns".stage_hunk()<CR>|           "Gitsigns
  nnoremap <M-g>u          <cmd>lua require"gitsigns".undo_stage_hunk()<CR>|      "
  nnoremap <M-g>r          <cmd>lua require"gitsigns".reset_hunk()<CR>|           "
  nnoremap <M-g>R          <cmd>lua require"gitsigns".reset_buffer()<CR>|         "
  nnoremap <M-g>p          <cmd>lua require"gitsigns".preview_hunk()<CR>|         "
  nnoremap <M-h>           <cmd>lua require"gitsigns.actions".next_hunk()<CR>|    "Next git modified chunk
  nnoremap <M-S-h>         <cmd>lua require"gitsigns.actions".prev_hunk()<CR>|    "Previous git modified chunk

  nnoremap <M-l>h          <cmd>lua vim.lsp.buf.hover()<CR>|                      "LSP commands
  nnoremap <M-l>f          <cmd>lua vim.lsp.buf.formatting()<CR>|                 "
  nnoremap <M-l>a          <cmd>lua vim.lsp.buf.code_action()<CR>|                "
  nnoremap <M-l>i          <cmd>lua vim.lsp.buf.implementation()<CR>|             "LSP Motions
  nnoremap <M-l>t          <cmd>lua vim.lsp.buf.type_definition()<CR>|            "
  nnoremap <M-l>d          <cmd>lua vim.lsp.buf.declaration()<CR>|                "
  nnoremap <M-e>           <cmd>lua vim.diagnostic.goto_next()<CR>|               "
  nnoremap <M-S-e>         <cmd>lua vim.diagnostic.goto_prev()<CR>|               "
"}}}
