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
  "}}}

  "Visual {{{
    Plug 'drmikehenry/vim-fontsize', !empty($NVIM_GUI) ? {} : { 'on': [] }     "Change GUI font size
    Plug 'troydm/zoomwintab.vim'                                               "Maximize window
    Plug 'akinsho/bufferline.nvim'                                             "Information on buffer line

    "vim-airline {{{
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
    "}}}

    "Themes {{{
      Plug 'AlessandroYorba/Alduin'
      Plug 'jnurmine/zenburn'
      Plug 'ellisonleao/gruvbox.nvim'                                          "(5) TreeSitter & startify support
      Plug 'ishan9299/nvim-solarized-lua'
    "}}}
  "}}}

  "General {{{
    Plug 'mhinz/vim-startify'                                                  "Start screen
    Plug 'lambdalisue/suda.vim', { 'on': ['SudaRead', 'SudaWrite'] }           "Open/Save file as root
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                         "Edit history on current buffer
    Plug 'machakann/vim-highlightedyank'                                       "Highlight yakend text
    Plug 'bronson/vim-visual-star-search'                                      "Find text under cursor by pressing *
    Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermRepl'] }    "Terminal
    Plug 'windwp/vim-floaterm-repl', { 'on': ['FloatermNew', 'FloatermRepl'] } "Execute selection on terminal
    Plug 'famiu/bufdelete.nvim', { 'on': ['Bdelete', 'Bwipeout'] }             "Close buffer without changing layout
    Plug 'nacro90/numb.nvim'                                                   "Previews destination line on jump
    Plug 'lewis6991/gitsigns.nvim'                                             "(2) Git visual tools
  "}}}

  "View & Navigation {{{
    Plug 'kshenoy/vim-signature'                                               "Show and manipulate marks
    Plug 'zhimsel/vim-stay'                                                    "Keeps last view of buffer/file
    Plug 'oberblastmeister/rooter.nvim'                                        "Jumps to project root when file is open
    Plug 'Konfekt/FastFold'                                                    "Simplify folding and unfolding blocks
    Plug 'Konfekt/FoldText'                                                    "Show info on folded blocks
    Plug 'lukas-reineke/indent-blankline.nvim'                                 "Indent lines properly
  "}}}

  "Motion & Objects {{{
    Plug 'phaazon/hop.nvim'                                                    "Hop motions
    Plug 'tpope/vim-commentary'                                                "Comment motions
    Plug 'matze/vim-move'                                                      "Move lines or selected blocks
    Plug 'tpope/vim-jdaddy'                                                    "Json!
    Plug 'tpope/vim-surround'                                                  "Bracket objects
    Plug 'wellle/targets.vim'                                                  "Text objects
    Plug 'michaeljsmith/vim-indent-object'                                     "Indentation objects
    Plug 'mizlan/iswap.nvim'                                                   "Swap elements in lists
  "}}}

  "Tmux {{{
    Plug 'christoomey/vim-tmux-navigator'                                      "Navigate between tmux & vim panels
    Plug 'roxma/vim-tmux-clipboard', !empty($NVIM_TMUX) ? {} : { 'on': [] }    "Share yank/clipboard between tmux & vim
  "}}}

  "Telescope {{{
    Plug 'nvim-telescope/telescope.nvim'                                       "(2) search popups!
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }          "
    Plug 'cljoly/telescope-repo.nvim'                                          "(2) Jump to any repo
    Plug 'AckslD/nvim-neoclip.lua'                                             "(4)
  "}}}

  "Treesitter {{{
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }              "Syntax based on code tree
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'                         "Syntax related objects
    Plug 'p00f/nvim-ts-rainbow'                                                "Multi color parentheses
    Plug 'romgrk/nvim-treesitter-context'                                      "Show cursor context
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'                         "Change commentstring based on treesitter
    Plug 'nvim-treesitter/nvim-treesitter-refactor'                            "Highlight and navigate based on treesitter
    Plug 'haringsrob/nvim_context_vt'                                          "Shows context on code blocks
    Plug 'mfussenegger/nvim-treehopper'
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

  "Database {{{
    Plug 'tpope/vim-dadbod', { 'on': 'DBUIToggle' }                            "DB connector
    Plug 'tpope/vim-dotenv'                                                    "Load environment vars
    Plug 'kristijanhusak/vim-dadbod-ui', { 'on': 'DBUIToggle' }                "Simple UI for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUIToggle' }        "Autocomplete for dadbod
  "}}}

  "VimWiki {{{
    Plug 'vimwiki/vimwiki'                                                     "Wiki
    Plug 'tools-life/taskwiki'                                                 "Taskwarrior integration
  "}}}

  call plug#end()
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
    set foldmethod=indent
    set nu
    set showbreak=↪\
    set listchars=tab:→\ ,eol:↲,trail:•,extends:»,precedes:«,nbsp:‡
    set splitbelow
    set splitright
    set formatoptions+=j
  "}}}

  "Plugin config {{{
    "Visual {{{
      "vim-airline {{{
        let g:airline_theme='distinguished'
        let g:airline#extensions#tabline#enabled = 0
        let g:airline_powerline_fonts = 1
        let g:airline_section_x = '[%{&filetype}]'
      "}}}

      "Themes {{{
        colorscheme gruvbox
        set background=dark
      "}}}
    "}}}

    "General {{{

      function! s:gitModified()
          let files = systemlist('git ls-files -m 2>/dev/null')
          return map(files, "{'line': v:val, 'path': v:val}")
      endfunction
      function! s:gitUntracked()
          let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
          return map(files, "{'line': v:val, 'path': v:val}")
      endfunction
      let g:startify_lists = [
              \ { 'type': 'files',     'header': ['   MRU']            },
              \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
              \ { 'type': 'sessions',  'header': ['   Sessions']       },
              \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
              \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
              \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
              \ { 'type': 'commands',  'header': ['   Commands']       },
              \ ]

      let g:suda_smart_edit = 1

      let g:floaterm_keymap_toggle = '<C-M-t>'
      let g:floaterm_keymap_next = '<C-M-j>'
      let g:floaterm_keymap_prev = '<C-M-k>'
      let g:floaterm_width = 0.8
      let g:floaterm_height = 0.8
      let g:floaterm_opener = 'edit'
      let g:floaterm_autoclose = 1
      hi FloatermNC guibg=gray
      let g:floaterm_repl_runner = expand(stdpath('config').'/repl-runner.sh')
    "}}}

    "Tmux {{{
      let g:tmux_navigator_no_mappings = 1
    "}}}

    "View & Navigation {{{
      let g:fastfold_savehook = 0

      let g:indent_blankline_space_char = '.'
      let g:indent_blankline_char = '|'
      let g:indent_blankline_show_end_of_line = v:true
      let g:indent_blankline_show_trailing_blankline_indent = v:true
      let g:indent_blankline_show_foldtext = v:true
      let g:indent_blankline_use_treesitter = v:true
      let g:indent_blankline_show_current_context = v:true
      let g:indent_blankline_context_patterns = ['class', 'function', 'method', '^if', '^for']
      let g:indent_blankline_buftype_exclude = ['terminal']
    "}}}

    "Motion & Objects {{{
      let g:move_key_modifier = 'C'
      let g:wordmotion_uppercase_spaces = ['-']
    "}}}

    "Autocomplete {{{
      set completeopt=menuone,noselect
      set foldmethod=expr
      set foldexpr=nvim_treesitter#foldexpr()
    "}}}

    "Database {{{
      let g:db_ui_show_help = 0
      let g:db_ui_disable_mappings = 1
      let g:db_ui_dotenv_variable_prefix = 'DATABASE_'
      let g:db_ui_save_location = expand(stdpath('data').'/dadbod-ui')
      let g:db_ui_auto_execute_table_helpers = 1

      autocmd FileType dbui nmap <buffer> <Enter> <Plug>(DBUI_SelectLine)
      autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine)
      autocmd FileType dbui nmap <buffer> R <Plug>(DBUI_Redraw)
      autocmd FileType dbui nmap <buffer> W <Plug>(DBUI_SaveQuery)
      autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
    "}}}

   "VimWiki {{{
      let g:vimwiki_list = [{'path':  expand(stdpath('data').'/vimwiki/argallar'),
                            \ 'path_html': expand(stdpath('data').'/vimwiki/argallar/html/')},
                            \ {'path':  expand(stdpath('data').'/vimwiki/curro'),
                            \ 'path_html': expand(stdpath('data').'/vimwiki/curro/html/')}]
    "}}}

  "}}}
"}}}

"{{{
  lua <<EOF

    require('numb').setup()
    require('gitsigns').setup()
    require('rooter').setup({ echo = false })
    require('hop').setup()
    require('neoclip').setup({
      content_spec_colunm = true,
      history = 1000,
      enable_persistant_history = true,
      db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
      on_paste = { set_reg = true, },
      telescope = {
        keys = {
          i = { select = '<CR>', paste = '<CR>', paste_behind = '<C-S-v>', },
          n = { select = '<CR>', paste = '<CR>', paste_behind = '<C-S-v>', },
        },
      },
    })

    require('telescope').setup{defaults = { prompt_prefix="🔍 ", }, }
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('repo')
    require('telescope').load_extension('neoclip')

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.settings({
      ui = { icons = { server_installed = "✓", server_pending = "➜", server_uninstalled = "✗" } }
    })
    lsp_installer.on_server_ready(function(server)
      local opts = {
        capabilities = capabilities
      }
      server:setup(opts)
    end)

    require('nvim-autopairs').setup({
      check_ts = true,
      ts_config = {},
      enable_check_bracket_line = false,
      ignored_next_char = "[%w%.]",
      fast_wrap = {
        map = '<M-p>', chars = { '{', '[', '(', '"', "'" }, end_key = '$', check_comma = true, hightlight = 'Search'
      },
    })
    require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
    require('nvim-autopairs').enable()
    require('nvim-treesitter.configs').setup{
      ensure_installed = "all",
      highlight = { enable = true },
      context_commentstring = { enable = true },
      indent = { emable = true },
      rainbow = { enable = true, extended_mode = true },
      autopairs = { enable = true },
      refactor = {
        highlight_definitions = { enable = true },
        smart_rename = { enable = true, keymaps = { smart_rename = "<M-r>" } },
        navigation = {
          enable = true,
          keymaps = { goto_definition = "<M-d>", goto_next_usage = "<M-j>", goto_previous_usage = "<M-k>", },
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { [")"] = "@function.outer", ["<M-)>"] = "@statement.outer", },
          goto_previous_start = { ["("] = "@function.outer", ["<M-(>"] = "@statement.outer", },
        },
      },
    }

    -- require('snippets').use_suggested_mappings()
    local lspkind = require('lspkind')
    lspkind.init({
        with_text = true,
        preset = 'codicons',
        symbol_map = {
          Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ", Variable = "", Class = "ﴯ",
          Interface = "", Module = "", Property = "ﰠ", Unit = "塞", Value = "", Enum = "", Keyword = "",
          Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "",
          Struct = "פּ", Event = "", Operator = "", TypeParameter = ""
        },
    })
    local cmp = require('cmp')
    cmp.setup({
      mapping = {
        ['<C-j>'] = cmp.mapping.scroll_docs(-4), ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-SPACE>'] = cmp.mapping.complete(), ['<C-ENTER>'] = cmp.mapping.close(),
        ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'tmux' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'autopairs' },
        { name = 'nvim_lsp_signature_help' },
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]
          return vim_item
        end
      },
    })
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

    require('bufferline').setup({
      options = {
        numbers = "none", middle_mouse_command = nil, diagnostics = "nvim_lsp", custom_filter = nil,
        close_command = "Bdelete! %d", right_mouse_command = "Bdelete! %d", left_mouse_command = "buffer %d",
        indicator_icon = '▎', buffer_close_icon = '', modified_icon = '●', close_icon = '',
        left_trunc_marker = '', right_trunc_marker = '',
        max_name_length = 18, max_prefix_length = 15, tab_size = 24,
        name_formatter = function(buf)
                           if buf.name:match('%.md') then
                             return vim.fn.fnamemodify(buf.name, ':t:r')
                           end
                         end,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
                                  local s = " "
                                  for e, n in pairs(diagnostics_dict) do
                                    if e == "error" then
                                      s = s .. " "
                                    end
                                  end
                                  return s
                                end,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}}, sort_by = 'id',
        show_buffer_icons = true, show_buffer_close_icons = false, show_close_icon = false, show_tab_indicators = true,
        persist_buffer_sort = true, separator_style = "slant", enforce_regular_tabs = false, always_show_bufferline = true,
        custom_areas = {
          right = function()
                    local result = {}
                    local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                    local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                    local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                    local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])
                    if error ~= 0 then
                      table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                    end
                    if warning ~= 0 then
                      table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                    end
                    if hint ~= 0 then
                      table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                    end
                    if info ~= 0 then
                      table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                    end
                    return result
                  end,
        },
      },
    })
  --}}}
EOF
"}}}

"Functions {{{
  au VimResized * exe "normal! \<C-w>="

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

"Shortcuts {{{
  let mapleader = "\<SPACE>"
  let g:mapleader = "\<SPACE>"

  cnoremap <EXPR> %%      getcmdtype() == ':' ? expand('%:h').'/' : '%%'         "Expand HOME path on command
  inoremap <EXPR><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"|                    "
  inoremap <EXPR><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"|                  "
  nnoremap <C-M-V>        "+gP|                                                  "
  inoremap <C-M-V>        <C-R>+|                                                "
  cnoremap <C-M-V>        <C-R>+|                                                "Copy & Paste
  vmap     <C-c>          "+yi|                                                  "shortcuts
  xnoremap "+y            y:call system("wl-copy", @")<CR>|                      "

  cmap w!!                SudaWrite|                                             "Write as root
  cmap e!!                SudaRead|                                              "Read as root

  nnoremap <C-a>          <CMD>exec "normal! ggVG"<CR>|                          "Select all text in buffer
  nnoremap <C-n>          <CMD>bnext<CR>|                                        "Focus next buffer
  nnoremap <C-m>          <CMD>bprevious<CR>|                                    "Focus previous buffer
  nnoremap <C-w>f         <CMD>ZoomWinTabToggle<CR>|                             "Get current focus full-size
  nnoremap <C-w>k         <CMD>TmuxNavigateUp<CR>|                               "
  nnoremap <C-w>j         <CMD>TmuxNavigateDown<CR>|                             "TMUX
  nnoremap <C-w>h         <CMD>TmuxNavigateLeft<CR>|                             "
  nnoremap <C-w>l         <CMD>TmuxNavigateRight<CR>|                            "

  nnoremap <LEADER>v      <C-v>|                                                 "Cursor visual mode
  nmap     <LEADER>R      <CMD>source $MYVIMRC<CR>|                              "Reload config
  nnoremap <LEADER>ip     <CMD>set invpaste paste?<CR>|                          "Toggle paste modes
  nmap     <LEADER>c      <CMD>IndentBlanklineToggle<CR>|                        "Show empty lines as they were indented
  nnoremap <LEADER>ln     <CMD>set relativenumber!<CR>|                          "Toggle line numbers relative/absolute
  nnoremap <LEADER>lh     <CMD>call<SID>LongLineHLToggle()<CR>|                  "Highlight text above col 80
  nnoremap <LEADER>p      <CMD>Telescope neoclip<CR>|                            "Yank stack
  nnoremap <LEADER>u      <CMD>UndotreeToggle<CR>|                               "Open change history for buffer
  nnoremap <LEADER>h      <CMD>cd<CR>|                                           "Switch CWD to $home directory
  nnoremap <LEADER>cwd    <CMD>cd %:p:h<CR>:pwd<CR>|                             "Switch CWD to the directory of the open buffer
  nnoremap <LEADER>"      <CMD>Telescope registers theme=get_dropdown<CR>|       "List of registers
  nnoremap <LEADER>:      <CMD>Telescope command_history theme=get_dropdown<CR>| "List of executed commands
  nnoremap <LEADER>/      <CMD>Telescope search_history theme=get_dropdown<CR>|  "List of executed searches
  nnoremap <LEADER><TAB>  <CMD>Telescope commands<CR>|                           "List of possible commands
  nnoremap <LEADER><S-TAB> <CMD>Telescope keymaps<CR>|                           "List of possible shortcuts
  nnoremap <LEADER><M-TAB> <CMD>Telescope help_tags<CR>|                         "List of help topics
  nnoremap <LEADER>j      <CMD>%!jq '.'<CR>|                                     "Format as json
  nnoremap <LEADER>x      <CMD>FormatXML<CR>|                                    "Format as XML
  nnoremap <LEADER>dt     <CMD>diffthis<CR>|                                     "Activate diff on buffer
  nnoremap <LEADER>do     <CMD>diffoff<CR>|                                      "Deactivate diff on buffer

  nnoremap <LEADER>fl     <CMD>Telescope current_buffer_fuzzy_find<CR>|          "
  nnoremap <LEADER>fh     <CMD>Telescope oldfiles<CR>|                           "
  nnoremap <LEADER>ff     <CMD>FloatermNew broot<CR>|                            "Open files
  nnoremap <LEADER>fif    <CMD>Telescope live_grep<CR>|                          "
  nnoremap <LEADER>fb     <CMD>Telescope buffers theme=get_dropdown layout_config.width=0. layout_config.height=0.2<CR>
  nnoremap <LEADER>F      <CMD>Telescope builtin theme=get_dropdown layout_config.height=085 previewer=false<CR>

  nnoremap <LEADER>t      <CMD>FloatermNew<CR>|                                  "
  vnoremap <LEADER>t      :FloatermNew<CR>|                                      "
  vnoremap <LEADER>ts     :FloatermSend<CR>|                                     "
  nnoremap <LEADER>tc     <CMD>FloatermRepl<CR>|                                 "Open terminals
  vnoremap <LEADER>tc     :FloatermRepl<CR>|                                     "
  nnoremap <LEADER>tp     <CMD>FloatermNew python<CR>|                           "
  vnoremap <LEADER>tp     :FloatermNew python<CR>|                               "
  nnoremap <LEADER>tb     <CMD>FloatermNew bpytop<CR>|                           "

  nnoremap <LEADER>gb     <CMD>Gitsigns toggle_current_line_blame<CR>|           "Activate blame per line
  nnoremap <LEADER>gc     <CMD>Telescope git_commits<CR>|                        "List of repository commits
  nnoremap <LEADER>gC     <CMD>Telescope git_bcommits<CR>|                       "List of file commits
  nnoremap <LEADER>gst    <CMD>Telescope git_status theme=get_dropdown layout_config.height=0.2<CR>
  nnoremap <LEADER>gR     <CMD>Telescope repo list<CR>|                          "List system repositories
  nnoremap <LEADER>tg     <CMD>FloatermNew lazygit<CR>|                          "Open lazygit term

  nnoremap <LEADER>wr     <CMD>Telescope lsp_references theme=get_dropdown<CR>|  "LSP references inside file
  nnoremap <LEADER>wi     <CMD>Telescope treesitter<CR>|                         "Treesitter references inside file
  nnoremap <LEADER>ws     <CMD>Telescope lsp_document_symbols<CR>|               "LSP symbols inside file
  nnoremap <LEADER>wd     <CMD>Telescope lsp_workspace_diagnostics theme=get_dropdown layout_config.width=0.7<CR>

  nnoremap <LEADER>ax     <CMD>AnsibleVaultDecrypt<CR>|                          "Decrypt an Ansible vault
  nnoremap <LEADER>aX     <CMD>AnsibleVaultEncrypt<CR>|                          "Encrypt a file using Ansible vault
  nnoremap <LEADER>bd     <CMD>DBUIToggle<CR>|                                   "Activate/deactivate DB-UI
  vnoremap <LEADER><ENTER> :DB<CR>|                                              "Execute query
  " nmap gqaj             Pretifies JSON under cursor
  " nmap gwaj             Takes the JSON object on the clipboard and extends it into the JSON object under the cursor.

  nnoremap <M-g>s         <CMD>lua require"gitsigns".stage_hunk()<CR>|           "
  nnoremap <M-g>u         <CMD>lua require"gitsigns".undo_stage_hunk()<CR>|      "
  nnoremap <M-g>r         <CMD>lua require"gitsigns".reset_hunk()<CR>|           "Gitsigns
  nnoremap <M-g>R         <CMD>lua require"gitsigns".reset_buffer()<CR>|         "
  nnoremap <M-g>p         <CMD>lua require"gitsigns".preview_hunk()<CR>|         "

  nnoremap <M-h>          <CMD>lua vim.lsp.buf.hover()<CR>|                      "LSP commands
  nnoremap <M-f>          <CMD>lua vim.lsp.buf.formatting()<CR>|                 "
  nnoremap <M-a>          <CMD>lua vim.lsp.buf.code_action()<CR>|                "

  " inoremap <M-n>          <CMD>lua return require('snippets').expand_or_advance(1)<CR>|  "Next snippet
  " inoremap <M-m>          <CMD>lua return require('snippets').advance_snippet(-1)<CR>|   "Previous snippet

"}}}

" Text objects & Motions {{{
  onoremap ie             <CMD>exec "normal! ggVG"<CR>|                          "Text object for whole buffer
  onoremap iv             <CMD>exec "normal! HVL"<CR>|                           "Text object for whole view
  xnoremap iz             <CMD>FastFoldUpdate<CR><ESC>:<C-u>normal! ]zv[z<CR>|   "Text object for inside fold
  xnoremap az             <CMD>FastFoldUpdate<CR><ESC>:<C-u>normal! ]zV[z<CR>]   "Text object for arround fold
  xnoremap ih             <CMD>lua require('gitsigns').select_hunk()<CR>|        "Text object for inside hunk (git mod.)
  onoremap ih             <CMD>lua require('gitsigns').select_hunk()<CR>|        "Text object for inside hunk (git mod.)
  " onoremap [iIaA] [nl_] (){}B[]<>t'`",.;:+-=~_*#/|\&$a Text objects for any of those (t=tag, a=argument)
  " onoremap [ia] iI        Text objects for indentation level
  " onoremap [ia]j          Text objects for Json

  nnoremap <M-w>          <CMD>HopWord<CR>|                                      "
  nnoremap <M-p>          <CMD>HopPattern<CR>|                                   "
  omap     <silent>m      :<C-U>lua require('tsht').nodes()<CR>|                 "Treesitter hop!
  vnoremap <silent>m      :lua require('tsht').nodes()<CR>|                      "

  nnoremap <M-g>n         <CMD>lua require"gitsigns.actions".next_hunk()<CR>|    "Next git modified chunk
  nnoremap <M-g>b         <CMD>lua require"gitsigns.actions".prev_hunk()<CR>|    "Previous git modified chunk

  nnoremap <M-s>          <CMD>ISwap<CR>|                                        "Swap list elements
  nnoremap <M-e>          <CMD>lua vim.lsp.diagnostic.goto_next()<CR>|           "
  nnoremap <M-S-e>        <CMD>lua vim.lsp.diagnostic.goto_prev()<CR>|           " LSP Motions
  nnoremap <M-i>          <CMD>lua vim.lsp.buf.implementation()<CR>|             "
  nnoremap <M-t>          <CMD>lua vim.lsp.buf.type_definition()<CR>|            "
  nnoremap <M-S-d>        <CMD>lua vim.lsp.buf.declaration()<CR>|                "
"}}}
