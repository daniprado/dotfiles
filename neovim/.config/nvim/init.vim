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
    Plug 'nvim-lua/popup.nvim'                                                 "Lua libraries
    Plug 'nvim-lua/plenary.nvim'                                               "Lua libraries
    Plug 'kyazdani42/nvim-web-devicons'                                        "Lua libraries
    Plug 'tami5/sqlite.lua'                                                    "Lua libraries
    Plug 'rktjmp/lush.nvim'                                                    "Colorscheme Lua lib
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
      Plug 'ellisonleao/gruvbox.nvim'
      Plug 'ishan9299/nvim-solarized-lua'
    "}}}
  "}}}

  "General {{{
    Plug 'lambdalisue/suda.vim', { 'on': ['SudaRead', 'SudaWrite'] }           "Open/Save file as root
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                         "Edit history on current buffer
    Plug 'machakann/vim-highlightedyank'                                       "Highlight yakend text
    Plug 'bronson/vim-visual-star-search'                                      "Find text under cursor by pressing *
    Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermRepl'] }    "Terminal
    Plug 'windwp/vim-floaterm-repl', { 'on': ['FloatermNew', 'FloatermRepl'] } "Execute selection on terminal
    Plug 'famiu/bufdelete.nvim', { 'on': ['Bdelete', 'Bwipeout'] }             "Close buffer without changing layout
    Plug 'nacro90/numb.nvim'                                                   "Previews destination line on jump
    Plug 'lewis6991/gitsigns.nvim'                                             "Git visual tools
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
    Plug 'svermeulen/vim-subversive'                                           "Substitute motions
    Plug 'tpope/vim-commentary'                                                "Comment motions
    Plug 'adelarsq/vim-matchit'                                                "Extended %
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
    Plug 'tmux-plugins/vim-tmux', !empty($NVIM_TMUX) ? {} : { 'on': [] }       "Support for tmux.conf editing
  "}}}

  "Telescope {{{
    Plug 'nvim-telescope/telescope.nvim'                                       "search popups!
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }          "
    Plug 'cljoly/telescope-repo.nvim'                                          "
    Plug 'AckslD/nvim-neoclip.lua'                                             "
  "}}}

  "Treesitter {{{
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }              "Syntax based on code tree
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'                         "Syntax related objects
    Plug 'p00f/nvim-ts-rainbow'                                                "Multi color parentheses
    Plug 'romgrk/nvim-treesitter-context'                                      "Show cursor context
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'                         "Change commentstring based on treesitter
    Plug 'nvim-treesitter/nvim-treesitter-refactor'                            "Highlight and navigate based on treesitter
    Plug 'haringsrob/nvim_context_vt'                                          "Shows context on code blocks
    Plug 'mfussenegger/nvim-ts-hint-textobject'
  "}}}

  "LSP {{{
    Plug 'neovim/nvim-lspconfig'                                               "LSP support
    Plug 'williamboman/nvim-lsp-installer'                                     "Commands to install LSP servers
    Plug 'ray-x/lsp_signature.nvim'                                            "Show signature helper on autocomplete
    " Plug 'norcalli/snippets.nvim'                                              "Snippets
  "}}}

  "CMP {{{
    Plug 'hrsh7th/nvim-cmp'                                                    "Autocomplete engine
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
    Plug 'onsails/lspkind-nvim'                                                "Autocomplete icons
    Plug 'andersevenrud/compe-tmux', !empty($NVIM_TMUX) ? {} : { 'on': [] }    "Autocomplete for tmux
    Plug 'windwp/nvim-autopairs'                                               "Autocomplete on bracket-type chars
  "}}}

  "Database {{{
    Plug 'tpope/vim-dadbod', { 'on': 'DBUIToggle' }                            "DB connector
    Plug 'tpope/vim-dotenv'                                                    "Load environment vars
    Plug 'kristijanhusak/vim-dadbod-ui', { 'on': 'DBUIToggle' }                "Simple UI for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUIToggle' }        "Autocomplete for dadbod
  "}}}

  "Ansible {{{
    Plug 'pearofducks/ansible-vim'                                             "Ansible tools
    Plug 'b4b4r07/vim-ansible-vault', { 'on': ['AnsibleVaultDecrypt', 'AnsibleVaultEncrypt']}
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

    "Ansible {{{
      let g:ansible_unindent_after_newline = 1
      let g:ansible_yamlKeyName = 'yamlKey'
      let g:ansible_attribute_highlight = "ob"
      let g:ansible_name_highlight = 'd'
      let g:ansible_extra_keywords_highlight = 1
      let g:ansible_normal_keywords_highlight = 'Constant'
      let g:ansible_with_keywords_highlight = 'Constant'
      let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
      let g:ansible_goto_role_paths = './roles,../_common/roles'

      autocmd BufRead vault.yml :AnsibleVaultDecrypt
      autocmd BufWrite vault.yml :AnsibleVaultEncrypt
      autocmd BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
      autocmd BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
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

  "}}}
"}}}

"{{{
  lua <<EOF

    require('numb').setup()
    require('gitsigns').setup()
    require('rooter').setup({ echo = false })
    require('neoclip').setup({
      content_spec_colunm = true,
      history = 1000,
      enable_persistant_history = true,
      db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
      on_paste = { set_reg = true, },
      keys = {
        i = { select = '<cr>', paste = '<cr>', paste_behind = '<c-s-v>', },
        n = { select = '<cr>', paste = '<cr>', paste_behind = '<c-s-v>', },
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
        ['<C-space>'] = cmp.mapping.complete(), ['<C-enter>'] = cmp.mapping.close(),
        ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'tmux' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'autopairs' },
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]
          return vim_item
        end
      }
    })
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    cmp.setup.cmdline('/', {
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' }
        }, {
          { name = 'buffer' }
        })
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
"}}}

"Shortcuts {{{
  let mapleader = "\<space>"
  let g:mapleader = "\<space>"

  cnoremap <expr> %%      getcmdtype() == ':' ? expand('%:h').'/' : '%%'         "Expand HOME path on command
  inoremap <expr><tab>    pumvisible() ? "\<C-n>" : "\<tab>"|                    "
  inoremap <expr><S-tab>  pumvisible() ? "\<C-p>" : "\<S-tab>"|                  "
  nnoremap <C-M-V>        "+gP|                                                  "
  inoremap <C-M-V>        <C-R>+|                                                "
  cnoremap <C-M-V>        <C-R>+|                                                "Copy & Paste
  vmap     <C-c>          "+yi|                                                  "shortcuts
  xnoremap "+y            y:call system("wl-copy", @")<cr>|                      "

  cmap w!!                SudaWrite|                                             "Write as root
  cmap e!!                SudaRead|                                              "Read as root

  nnoremap <C-a>          <cmd>exec "normal! ggVG"<cr>|                          "Select all text in buffer
  nnoremap <C-n>          <cmd>bnext<cr>|                                        "Focus next buffer
  nnoremap <C-m>          <cmd>bprevious<cr>|                                    "Focus previous buffer
  nnoremap <C-w>f         <cmd>ZoomWinTabToggle<cr>|                             "Get current focus full-size
  nnoremap <C-w>k         <cmd>TmuxNavigateUp<cr>|                               "
  nnoremap <C-w>j         <cmd>TmuxNavigateDown<cr>|                             "TMUX
  nnoremap <C-w>h         <cmd>TmuxNavigateLeft<cr>|                             "
  nnoremap <C-w>l         <cmd>TmuxNavigateRight<cr>|                            "

  nnoremap <leader>v      <C-v>|                                                 "Cursor visual mode
  nmap     <leader>R      <cmd>source $MYVIMRC<cr>|                              "Reload config
  nnoremap <leader>ip     <cmd>set invpaste paste?<cr>|                          "Toggle paste modes
  nmap     <leader>c      <cmd>IndentBlanklineToggle<cr>|                        "Show empty lines as they were indented
  nnoremap <leader>ln     <cmd>set relativenumber!<cr>|                          "Toggle line numbers relative/absolute
  nnoremap <Leader>lh     <cmd>call<SID>LongLineHLToggle()<cr>|                  "Highlight text above col 80
  nnoremap <leader>p      <cmd>Telescope neoclip<cr>|                            "Yank stack
  nnoremap <leader>u      <cmd>UndotreeToggle<cr>|                               "Open change history for buffer
  nnoremap <leader>h      <cmd>cd<cr>|                                           "Switch CWD to $home directory
  nnoremap <leader>cwd    <cmd>cd %:p:h<cr>:pwd<cr>|                             "Switch CWD to the directory of the open buffer
  nnoremap <leader>"      <cmd>Telescope registers theme=get_dropdown<cr>|       "List of registers
  nnoremap <leader>:      <cmd>Telescope command_history theme=get_dropdown<cr>| "List of executed commands
  nnoremap <leader>/      <cmd>Telescope search_history theme=get_dropdown<cr>|  "List of executed searches
  nnoremap <leader><tab>  <cmd>Telescope commands<cr>|                           "List of possible commands
  nnoremap <leader><S-tab> <cmd>Telescope keymaps<cr>|                           "List of possible shortcuts
  nnoremap <leader><M-tab> <cmd>Telescope help_tags<cr>|                         "List of help topics
  nnoremap <leader>j      <cmd>%!jq '.'<cr>|                                     "Format as json
  nnoremap <leader>x      <cmd>FormatXML<cr>|                                    "Format as XML
  nnoremap <leader>dt     <cmd>diffthis<cr>|                                     "Activate diff on buffer
  nnoremap <leader>do     <cmd>diffoff<cr>|                                      "Deactivate diff on buffer

  nnoremap <leader>fl     <cmd>Telescope current_buffer_fuzzy_find<cr>|          "
  nnoremap <leader>fh     <cmd>Telescope oldfiles<cr>|                           "
  nnoremap <leader>ff     <cmd>FloatermNew broot<cr>|                            "Open files
  nnoremap <leader>fif    <cmd>Telescope live_grep<cr>|                          "
  nnoremap <leader>fb     <cmd>Telescope buffers theme=get_dropdown layout_config.width=0. layout_config.height=0.2<cr>
  nnoremap <leader>F      <cmd>Telescope builtin theme=get_dropdown layout_config.height=085 previewer=false<cr>

  nnoremap <leader>t      <cmd>FloatermNew<cr>|                                  "
  vnoremap <leader>t      :FloatermNew<cr>|                                      "
  vnoremap <leader>ts     :FloatermSend<cr>|                                     "
  nnoremap <leader>tc     <cmd>FloatermRepl<cr>|                                 "Open terminals
  vnoremap <leader>tc     :FloatermRepl<cr>|                                     "
  nnoremap <leader>tp     <cmd>FloatermNew python<cr>|                           "
  vnoremap <leader>tp     :FloatermNew python<cr>|                               "
  nnoremap <leader>tb     <cmd>FloatermNew bpytop<cr>|                           "

  nnoremap <leader>gb     <cmd>Gitsigns toggle_current_line_blame<cr>|           "Activate blame per line
  nnoremap <leader>gc     <cmd>Telescope git_commits<cr>|                        "List of repository commits
  nnoremap <leader>gC     <cmd>Telescope git_bcommits<cr>|                       "List of file commits
  nnoremap <leader>gst    <cmd>Telescope git_status theme=get_dropdown layout_config.height=0.2<cr>
  nnoremap <leader>gR     <cmd>Telescope repo list<cr>|                          "List system repositories
  nnoremap <leader>tg     <cmd>FloatermNew lazygit<cr>|                          "Open lazygit term

  nnoremap <leader>wr     <cmd>Telescope lsp_references theme=get_dropdown<cr>|  "LSP references inside file
  nnoremap <leader>wi     <cmd>Telescope treesitter<cr>|                         "Treesitter references inside file
  nnoremap <leader>ws     <cmd>Telescope lsp_document_symbols<cr>|               "LSP symbols inside file
  nnoremap <leader>wd     <cmd>Telescope lsp_workspace_diagnostics theme=get_dropdown layout_config.width=0.7<cr>

  nnoremap <leader>ax     <cmd>AnsibleVaultDecrypt<cr>|                          "Decrypt an Ansible vault
  nnoremap <leader>aX     <cmd>AnsibleVaultEncrypt<cr>|                          "Encrypt a file using Ansible vault
  nnoremap <leader>bd     <cmd>DBUIToggle<cr>|                                   "Activate/deactivate DB-UI
  vnoremap <leader><enter> :DB<cr>|                                              "Execute query
  " nmap gqaj             Pretifies JSON under cursor
  " nmap gwaj             Takes the JSON object on the clipboard and extends it into the JSON object under the cursor.

  nnoremap <M-g>s         <cmd>lua require"gitsigns".stage_hunk()<cr>|           "
  nnoremap <M-g>u         <cmd>lua require"gitsigns".undo_stage_hunk()<cr>|      "
  nnoremap <M-g>r         <cmd>lua require"gitsigns".reset_hunk()<cr>|           "Gitsigns
  nnoremap <M-g>R         <cmd>lua require"gitsigns".reset_buffer()<cr>|         "
  nnoremap <M-g>p         <cmd>lua require"gitsigns".preview_hunk()<cr>|         "

  nnoremap <M-h>          <cmd>lua vim.lsp.buf.hover()<cr>|                      "LSP commands
  nnoremap <M-f>          <cmd>lua vim.lsp.buf.formatting()<cr>|                 "
  nnoremap <M-a>          <cmd>lua vim.lsp.buf.code_action()<cr>|                "

  " inoremap <M-n>          <cmd>lua return require('snippets').expand_or_advance(1)<cr>|  "Next snippet
  " inoremap <M-m>          <cmd>lua return require('snippets').advance_snippet(-1)<cr>|   "Previous snippet

"}}}

" Text objects & Motions {{{
  onoremap ie             <cmd>exec "normal! ggVG"<cr>|                          "Text object for whole buffer
  onoremap iv             <cmd>exec "normal! HVL"<cr>|                           "Text object for whole view
  xnoremap iz             <cmd>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>|   "Text object for inside fold
  xnoremap az             <cmd>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>]   "Text object for arround fold
  xnoremap ih             <cmd>lua require('gitsigns').select_hunk()<cr>|        "Text object for inside hunk (git mod.)
  onoremap ih             <cmd>lua require('gitsigns').select_hunk()<cr>|        "Text object for inside hunk (git mod.)
  " onoremap [iIaA] [nl_] (){}B[]<>t'`",.;:+-=~_*#/|\&$a Text objects for any of those (t=tag, a=argument)
  " onoremap [ia] iI        Text objects for indentation level
  " onoremap [ia]j          Text objects for Json
  nmap s                  <plug>(SubversiveSubstitute)                           "Replace next text object with yank content
  nmap sL                 <plug>(SubversiveSubstituteLine)                       "Replace line with yank content
  nmap sS                 <plug>(SubversiveSubstituteToEndOfLine)                "Replase till EOL with yank content
  " nmap [cdy]s             Change,delete,add surround: accepts text object + 1 or 2 brackets

  nnoremap <M-w>          <cmd>HopWord<cr>|                                      "
  omap     <silent>m      :<C-U>lua require('tsht').nodes()<cr>|                 "Treesitter hop!
  vnoremap <silent>m      :lua require('tsht').nodes()<cr>|                      "

  nnoremap <M-g>n         <cmd>lua require"gitsigns.actions".next_hunk()<cr>|    "Next git modified chunk
  nnoremap <M-g>b         <cmd>lua require"gitsigns.actions".prev_hunk()<cr>|    "Previous git modified chunk

  nnoremap <M-s>          <cmd>ISwap<cr>|                                        "Swap list elements
  nnoremap <M-e>          <cmd>lua vim.lsp.diagnostic.goto_next()<cr>|           "
  nnoremap <M-S-e>        <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>|           " LSP Motions
  nnoremap <M-i>          <cmd>lua vim.lsp.buf.implementation()<cr>|             "
  nnoremap <M-t>          <cmd>lua vim.lsp.buf.type_definition()<cr>|            "
  nnoremap <M-S-d>        <cmd>lua vim.lsp.buf.declaration()<cr>|                "
"}}}
