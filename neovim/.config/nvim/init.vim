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
    Plug 'nvim-lua/popup.nvim'                                                           "Lua libraries
    Plug 'nvim-lua/plenary.nvim'                                                         "Lua libraries
    Plug 'kyazdani42/nvim-web-devicons'                                                  "Lua libraries
    Plug 'rktjmp/lush.nvim'                                                              "Colorscheme Lua lib
  "}}}

  "Visual {{{
    Plug 'drmikehenry/vim-fontsize', !empty($NVIM_GUI) ? {} : { 'on': [] }               "Change GUI font size
    Plug 'troydm/zoomwintab.vim'                                                         "Maximize window
    Plug 'akinsho/nvim-bufferline.lua'                                                   "Information on buffer line

    "vim-airline {{{
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
    "}}}

    "Themes {{{
      Plug 'AlessandroYorba/Alduin'
      Plug 'jnurmine/zenburn'
      Plug 'npxbr/gruvbox.nvim'
      Plug 'ishan9299/nvim-solarized-lua'
    "}}}
  "}}}

  "General {{{
    Plug 'lambdalisue/suda.vim', { 'on': ['SudaRead', 'SudaWrite'] }                     "Open/Save file as root
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }                                   "Edit history on current buffer
    Plug 'AckslD/nvim-neoclip.lua'                                                       "Stack of yanks
    Plug 'machakann/vim-highlightedyank'                                                 "Highlight yakend text
    Plug 'bronson/vim-visual-star-search'                                                "Find text under cursor by pressing *
    Plug 'tversteeg/registers.nvim'                                                      "Show registers contents
    Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermRepl'] }              "Terminal
    Plug 'windwp/vim-floaterm-repl', { 'on': ['FloatermNew', 'FloatermRepl'] }           "Execute selection on terminal
    Plug 'famiu/bufdelete.nvim', { 'on': ['Bdelete', 'Bwipeout']}                        "Close buffer without changing layout
    Plug 'jghauser/mkdir.nvim'                                                           "Create folders needed on save
    Plug 'nacro90/numb.nvim'                                                             "Previews destination line on jump
  "}}}

  "Tmux {{{
    Plug 'christoomey/vim-tmux-navigator'                                                "Navigate between tmux & vim panels
    Plug 'roxma/vim-tmux-clipboard', !empty($NVIM_TMUX) ? {} : { 'on': [] }              "Share yank/clipboard between tmux & vim
    Plug 'wellle/tmux-complete.vim', !empty($NVIM_TMUX) ? {} : { 'on': [] }              "Autocomplete based on tmux panels content
    Plug 'tmux-plugins/vim-tmux', !empty($NVIM_TMUX) ? {} : { 'on': [] }                 "Support for tmux.conf editing
  "}}}

  "Git {{{
    Plug 'lewis6991/gitsigns.nvim'                                                       "Git visual tools
    Plug 'tpope/vim-fugitive', { 'on': [] }                                              "Git tools
  "}}}

  "Telescope {{{
    Plug 'nvim-telescope/telescope.nvim'                                                 "search popups!
  "}}}

  "View & Navigation {{{
    Plug 'kshenoy/vim-signature'                                                         "Show and manipulate marks
    Plug 'zhimsel/vim-stay'                                                              "Keeps last view of buffer/file
    Plug 'oberblastmeister/rooter.nvim'                                                  "Jumps to project root when file is open

    Plug 'Konfekt/FastFold'                                                              "Simplify folding and unfolding blocks
    Plug 'Konfekt/FoldText'                                                              "Show info on folded blocks
    Plug 'lukas-reineke/indent-blankline.nvim'                                           "Indent lines properly
    Plug 'chrisbra/NrrwRgn'                                                              "Open temporary buffer using selected content
  "}}}

  "Motion & Objects {{{
    Plug 'phaazon/hop.nvim'                                                              "Hop motions
    Plug 'svermeulen/vim-subversive'                                                     "Substitute motions
    Plug 'tpope/vim-commentary'                                                          "Comment motions
    Plug 'junegunn/vim-easy-align'                                                       "Align motions
    Plug 'adelarsq/vim-matchit'                                                          "Extended %
    Plug 'matze/vim-move'                                                                "Move lines or selected blocks
    Plug 'tpope/vim-jdaddy'                                                              "Json!
    Plug 'tpope/vim-surround'                                                            "Bracket objects
    Plug 'wellle/targets.vim'                                                            "Text objects
    Plug 'michaeljsmith/vim-indent-object'                                               "Indentation objects
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'                                   "Syntax related objects
  "}}}

  "Syntax {{{
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }                        "Syntax based on code tree
    Plug 'p00f/nvim-ts-rainbow'                                                          "Multi color parentheses
    Plug 'romgrk/nvim-treesitter-context'                                                "Show cursor context
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'                                   "Change commentstring based on treesitter
    Plug 'haringsrob/nvim_context_vt'                                                    "Shows context on code blocks
    Plug 'mizlan/iswap.nvim'                                                             "Swap elements in lists

    Plug 'zinit-zsh/zinit-vim-syntax'                                                    "Zinit plugin ZSH syntax
    Plug 'vim-scripts/autoit.vim', { 'on': [] }                                          "Syntax for AutoIT
    Plug 'PProvost/vim-ps1', { 'on': [] }                                                "Syntax for Powershell
  "}}}

  "LSP {{{
    Plug 'neovim/nvim-lspconfig'                                                         "LSP support
    Plug 'kabouzeid/nvim-lspinstall'                                                     "Commands to install LSP servers
    Plug 'norcalli/snippets.nvim', { 'on': [] }                                          "Snippets
    Plug 'mfussenegger/nvim-jdtls', { 'on': [] }                                         "Java utils
    Plug 'ray-x/lsp_signature.nvim'                                                      "Show signature helper on autocomplete
  "}}}

  "Autocomplete {{{
    Plug 'hrsh7th/nvim-compe'                                                            "Autocomplete engine
    Plug 'andersevenrud/compe-tmux', !empty($NVIM_TMUX) ? {} : { 'on': [] }              "Autocomplete for tmux
    Plug 'tamago324/compe-zsh'                                                           "Autocomplete for zsh
    Plug 'windwp/nvim-autopairs'                                                         "Autocomplete on bracket-type chars
    Plug 'windwp/nvim-ts-autotag', { 'on': [] }                                          "Autocomplete on html/php tags

  "}}}

  "Ansible {{{
    Plug 'pearofducks/ansible-vim'                                                       "Ansible tools
    Plug 'b4b4r07/vim-ansible-vault', { 'on': ['AnsibleVaultDecrypt', 'AnsibleVaultEncrypt']}
  "}}}

  "Database {{{
    Plug 'tpope/vim-dadbod', { 'on': 'DBUIToggle' }                                      "DB connector
    Plug 'tpope/vim-dotenv'                                                              "Load environment vars
    Plug 'kristijanhusak/vim-dadbod-ui', { 'on': 'DBUIToggle' }                          "Simple UI for dadbod
    Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUIToggle' }                  "Autocomplete for dadbod
  "}}}

  "Productivity {{{
    Plug 'vimwiki/vimwiki'                                                               "Wiki
    Plug 'tools-life/taskwiki'                                                           "Taskwarrior integration
    " Plug 'powerman/vim-plugin-AnsiEsc'                                                   "Colors on charts
  "}}}

  call plug#end()
"}}}

"Params {{{
  "General config {{{
    filetype plugin indent on
    syntax enable

    syntax on
    set ruler
    set relativenumber              " Line numbers are relative
    set number                      " Display the absolute line number at the line you're on
    set ls=2                        " Always show status bar
    set t_Co=256                    " 256 colors on console
    if (has("termguicolors"))
      set termguicolors
      hi LineNr ctermbg=NONE guibg=NONE
    endif
    set visualbell
    set viewoptions=cursor,folds,slash,unix

    set cursorline
    set cursorcolumn
    set fillchars+=vert:¦           " Improve tile division look
    set ttyfast                     " Improve screen redrawing
    set hidden                      " Hidde closed buffers
    set autoread                    " Read external changes on open files
    set ttimeoutlen=0               " No delay between modes
    set noshowmode
    set clipboard=unnamed
    set wildmode=longest:list,full  " Autocomplete behaviour
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    set incsearch                   " Incremental search
    set showmatch                   " Show matching bracket of cursor position
    set hlsearch                    " Show search results
    set smartcase
    set complete=.,w,b,t

    set undofile
    set backup
    set history=1000
    set undoreload=1000
    set undodir=$undodir//
    set directory=$swpdir//
    set backupdir=$bkdir//

    set expandtab                  " Replace \t with whitespaces
    set tabstop=4                  " # of whitespaces per \t
    set shiftwidth=2               " # of whitespaces per indent level
    set softtabstop=4              " # of whitespaces per \t
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
      let g:yoinkMaxItems = 100
      let g:yoinkSyncNumberedRegisters = 0
      let g:yoinkIncludeDeleteOperations = 1
      let g:yoinkSavePersistently = 1
      let g:yoinkIncludeNamedRegisters = 0
      let g:yoinkSyncSystemClipboardOnFocus = 1

      let g:floaterm_keymap_toggle = '<C-M-t>'
      let g:floaterm_keymap_next = '<C-M-l>'
      let g:floaterm_keymap_prev = '<C-M-h>'
      let g:floaterm_width = 0.8
      let g:floaterm_height = 0.8
      let g:floaterm_opener = 'edit'
      let g:floaterm_autoclose = 1
      hi FloatermNC guibg=gray
      let g:floaterm_repl_runner = expand(stdpath('config').'/repl-runner.sh')

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

"Lua scripts {{{
lua <<EOF

    require('numb').setup()
    require('gitsigns').setup()
    require('neoclip').setup({
      history = 1000,
      filter = nil,
      preview = true,
      default_register = '*',
      content_spec_column = false,
      on_paste = {
        set_reg = false,
      },
      keys = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
        },
        n = {
          select = '<cr>',
          paste = 'p',
          paste_behind = 'P',
        },
      },
    })
    require('telescope').setup{ defaults = { prompt_prefix="🔍 ", }, }
    require('telescope').load_extension('neoclip')

    require('lspinstall').setup()
    local function make_config()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      return {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
                      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
                      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
                    end,
      }
    end
    local function setup_servers()
      local servers = require('lspinstall').installed_servers()
      for _, lsp in ipairs(servers) do
        require('lspconfig')[lsp].setup(make_config())
      end
    end
    setup_servers()
    require('lspinstall').post_install_hook = function () setup_servers() vim.cmd("bufdo e") end
    require('lsp_signature').on_attach({
      bind = true,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      handler_opts = { border = "shadow" }
    })

    require('nvim-treesitter.configs').setup{
      ensure_installed = "all",
      highlight = { enable = true, },
      context_commentstring = { enable = true },
      -- autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = { emable = true },
      rainbow = { enable = true, extended_mode = true, },
      autopairs = {enable = true},
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["if"] = "@function.inner",
            ["af"] = "@function.outer",
            ["iC"] = "@class.inner",
            ["aC"] = "@class.outer",
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
            ["ic"] = "@call.inner",
            ["ac"] = "@call.outer",
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["iL"] = "@loop.inner",
            ["aL"] = "@loop.outer",
            ["iP"] = "@parameter.inner",
            ["aP"] = "@parameter.outer",
            ["aS"] = "@statement.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [")"] = "@function.outer",
            ["<M-)>"] = "@statement.outer",
          },
          goto_previous_start = {
            ["("] = "@function.outer",
            ["<M-(>"] = "@statement.outer",
          },
        },
      },
    }

    -- require('snippets').use_suggested_mappings()
    require('nvim-autopairs').setup({
      check_ts = true,
      ts_config = {},
      enable_check_bracket_line = false,
      fast_wrap = {
        map = '<M-s>',
        chars = { '{', '[', '(', '"', "'" },
        end_key = '$',
        check_comma = true,
        hightlight = 'Search'
      },
    })
    require("nvim-autopairs.completion.compe").setup({ map_cr = true, map_complete = true })
    require('nvim-autopairs').enable()

    require('rooter').setup({ echo = false })
    require('bufferline').setup({
      options = {
        numbers = "none",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        name_formatter = function(buf)
                           if buf.name:match('%.md') then
                             return vim.fn.fnamemodify(buf.name, ':t:r')
                           end
                         end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 24,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
                                  local s = " "
                                  for e, n in pairs(diagnostics_dict) do
                                    if e == "error" then
                                      s = s .. " "
                                    end
                                  end
                                  return s
                                end,
        custom_filter = nil,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id',
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

    require('compe').setup ({
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      resolve_timeout = 800;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' },
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
      };
      source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        tmux = {
          all_panes = true,
        };
        treesitter = true;
        vim_dadbod_completion = true;
        zsh = true;
        -- snippets = true;
      };
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

  cmap w!!                SudaWrite|                                                     " Write as root
  cmap e!!                SudaRead|                                                      " Read as root

  vnoremap <silent>*      :call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>|            " Find ahead word under the cursor
  vnoremap <silent>#      :call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>|            " Find back word under the cursor

  nnoremap <leader>v      <C-v>|                                                         " Cursor visual mode
  nnoremap <leader>u      <cmd>UndotreeToggle<cr>|                                       " Open change history for buffer
  nnoremap <leader>ip     <cmd>set invpaste paste?<cr>|                                  " Toggle paste modes
  nmap     <leader>s      <plug>(SubversiveSubstituteRange)|                             " Replace 1st motion inside 2nd with given text
  xmap     <leader>s      <plug>(SubversiveSubstituteRange)|                             " Replace 1st motion inside 2nd with given text
  nmap     <leader>R      <cmd>source $MYVIMRC<cr>|                                      " Reload config
  nnoremap <leader>jw     <cmd>HopWord<cr>|                                              "
  nnoremap <leader>jl     <cmd>HopLine<cr>|                                              " Hop
  nnoremap <leader>jc     <cmd>HopChar1<cr>|                                             "
  nnoremap <leader>jC     <cmd>HopChar2<cr>|                                             "
  nnoremap <leader>jp     <cmd>HopPattern<cr>|                                           "
  nnoremap <leader>be     <cmd>BufferLineSortByExtension<CR>|
  nnoremap <leader>bd     <cmd>BufferLineSortByDirectory<CR>|
  nmap     <leader>c      <cmd>IndentBlanklineToggle<cr>|                                " Show empty lines as they were indented
  nnoremap <leader>h      <cmd>cd<cr>|                                                   " Switch CWD to $home directory
  nnoremap <leader>pwd    <cmd>cd %:p:h<cr>:pwd<cr>|                                     " Switch CWD to the directory of the open buffer
  nnoremap <leader>ln     <cmd>set relativenumber!<cr>|                                  " Toggle line numbers relative/absolute
  nnoremap <Leader>lh     <cmd>call<SID>LongLineHLToggle()<cr>|                          " Highlight text above col 80
  nnoremap <leader>j      <cmd>%!jq '.'<cr>|                                             " Format as json
  nnoremap <leader>x      <cmd>FormatXML<cr>|                                            " Format as XML
  nnoremap <leader>dt     <cmd>diffthis<cr>|                                             " Activate diff on buffer
  nnoremap <leader>do     <cmd>diffoff<cr>|                                              " Deactivate diff on buffer
  " nnoremap <leader>nr     <cmd>NR<cr>|                  Already exists                   " Open narrowed window based on selection
  nnoremap <leader>nv     <cmd>NW!<cr>|                                                  " Open narrowed window based on view
  nnoremap <leader>nw     <cmd>WR!<cr>|                                                  " Close and save narrowed window
  nnoremap <leader>t      <cmd>FloatermNew<cr>|                                          " Open terminal
  vnoremap <leader>t      :FloatermNew<cr>|                                              " Open terminal
  vnoremap <leader>ts     :FloatermSend<cr>|                                             " Open terminal
  nnoremap <leader>tc     <cmd>FloatermRepl<cr>|                                         " Open term to execute
  vnoremap <leader>tc     :FloatermRepl<cr>|                                             " Open term to execute
  nnoremap <leader>tp     <cmd>FloatermNew python<cr>|                                   " Open python term
  vnoremap <leader>tp     :FloatermNew python<cr>|                                       " Open python term
  nnoremap <leader>tb     <cmd>FloatermNew bpytop<cr>|                                   " Open bpytop term
  nnoremap <leader>tg     <cmd>FloatermNew lazygit<cr>|                                  " Open lazygit term
  nnoremap <leader>F      <cmd>Telescope builtin theme=get_dropdown layout_config.height=0.85 previewer=false<cr>
  nnoremap <leader>fb     <cmd>Telescope buffers theme=get_dropdown layout_config.width=0.5 layout_config.height=0.2<cr>
  nnoremap <leader>fl     <cmd>Telescope current_buffer_fuzzy_find<cr>
  nnoremap <leader>fh     <cmd>Telescope oldfiles<cr>|                                   "
  nnoremap <leader>ff     <cmd>FloatermNew broot<cr>|                                    " Open broot terminal
  nnoremap <leader>fif    <cmd>Telescope live_grep<cr>|                                  " Telescope
  nnoremap <leader><tab>  <cmd>Telescope commands<cr>|                                   "
  nnoremap <leader><S-tab> <cmd>Telescope keymaps<cr>|                                   "
  nnoremap <leader><M-tab> <cmd>Telescope help_tags<cr>|                                 "

  nnoremap <leader>p      <cmd>Telescope neoclip<cr>|                                 "
  nnoremap <leader>r      <cmd>Telescope registers theme=get_dropdown layout_config.height=0.85<cr>
  nnoremap <leader>:      <cmd>Telescope command_history theme=get_dropdown layout_config.height=0.85<cr>
  nnoremap <leader>/      <cmd>Telescope search_history theme=get_dropdown layout_config.height=0.85<cr>
  nnoremap <leader>hs     <cmd>Gitsigns stage_hunk<cr>|                                  "
  nnoremap <leader>hu     <cmd>Gitsigns undo_stage_hunk<cr>|                             "
  nnoremap <leader>hr     <cmd>Gitsigns reset_hunk<cr>|                                  " Gitsigns
  nnoremap <leader>hR     <cmd>Gitsigns reset_buffer<cr>|                                "
  nnoremap <leader>hp     <cmd>Gitsigns preview_hunk<cr>|                                "
  nnoremap <leader>b      <cmd>Gitsigns toggle_current_line_blame<cr>:Gitsigns detach<cr>:Gitsigns attach<cr>
  nnoremap <leader>gc     <cmd>Telescope git_commits<cr>|                                "
  nnoremap <leader>gC     <cmd>Telescope git_bcommits<cr>|                               "
  nnoremap <leader>gst    <cmd>Telescope git_status theme=get_dropdown layout_config.height=0.2<cr>
  nnoremap <leader>ax     <cmd>AnsibleVaultDecrypt<cr>|                                  "
  nnoremap <leader>aX     <cmd>AnsibleVaultEncrypt<cr>|                                  "
  nnoremap <leader>bd     <cmd>DBUIToggle<cr>|                                           " Activate/deactivate DB-UI
  vnoremap <leader><enter> :DB<cr>|                                                      " Activate/deactivate DB-UI

  nnoremap <C-M-V>        "+gP|                                                          "
  inoremap <C-M-V>        <C-R>+|                                                        "
  cnoremap <C-M-V>        <C-R>+|                                                        " Copy & Paste
  vmap     <C-c>          "+yi|                                                          " shortcuts
  xnoremap "+y            y:call system("wl-copy", @")<cr>|                              "

  nnoremap <C-a>          <cmd>exec "normal! ggVG"<cr>|                                  " Select all text in buffer
  nnoremap <C-n>          <cmd>bnext<cr>|                                                " Focus next buffer
  nnoremap <C-m>          <cmd>bprevious<cr>|                                            " Focus previous buffer
  nnoremap <C-w>f         <cmd>ZoomWinTabToggle<cr>|                                     " Get current focus full-size
  nnoremap <C-w>k         <cmd>TmuxNavigateUp<cr>|                                       "
  nnoremap <C-w>j         <cmd>TmuxNavigateDown<cr>|                                     " TMUX
  nnoremap <C-w>h         <cmd>TmuxNavigateLeft<cr>|                                     "
  nnoremap <C-w>l         <cmd>TmuxNavigateRight<cr>|                                    "
  nnoremap <C-g>          <cmd>Gitsigns next_hunk<cr>|                                   " Next git modified chunk
  nnoremap <C-S-g>        <cmd>Gitsigns prev_hunk<cr>|                                   " Previous git modified chunk

  inoremap <expr><C-e>    compe#close('<C-e>')|                                          " Autocomplete
  inoremap <expr><C-Space> compe#complete()|                                             "
  inoremap <expr><cr>     compe#confirm('<CR>')|                                         "
  inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"|                            "
  inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"|                          "
  inoremap <expr><C-f>    compe#scroll({ 'delta': +4 })|                                 "
  inoremap <expr><C-b>    compe#scroll({ 'delta': -4 })|                                 "

  nnoremap <M-i>          <cmd>Telescope lsp_document_symbols<cr>|                       " LSP
  nnoremap <M-S-i>        <cmd>Telescope treesitter<cr>|                                 "
  nnoremap <M-a>          <cmd>lua vim.lsp.buf.code_action()<cr>|                        "
  nnoremap <M-e>          <cmd>lua vim.lsp.diagnostic.goto_next()<cr>|                   "
  nnoremap <M-S-e>        <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>|                   "
  nnoremap <M-h>          <cmd>lua vim.lsp.buf.hover()<cr>|                              "
  nnoremap <M-d>          <cmd>lua vim.lsp.buf.definition()<cr>|                         "
  nnoremap <M-S-d>        <cmd>lua vim.lsp.buf.declaration()<cr>|                        "
  nnoremap <M-g>          <cmd>lua vim.lsp.buf.type_definition()<cr>|                    "
  nnoremap <M-S-g>        <cmd>lua vim.lsp.buf.implementation()<cr>|                     "
  nnoremap <M-f>          <cmd>Telescope lsp_references theme=get_dropdown<cr>|          "
  nnoremap <M-r>          <cmd>lua vim.lsp.buf.rename()<cr>|                             "
  nnoremap <M-S-r>        <cmd>lua vim.lsp.buf.formatting()<cr>|                         "
  nnoremap <M-w>d         <cmd>Telescope lsp_workspace_diagnostics theme=get_dropdown layout_config.width=0.7<cr>
  nnoremap <M-s>          <cmd>ISwap<cr>|                                                " Swap list elements

  " inoremap <M-n>          <cmd>lua return require('snippets').expand_or_advance(1)<cr>|  " Next snippet
  " inoremap <M-m>          <cmd>lua return require('snippets').advance_snippet(-1)<cr>|   " Previous snippet

  nmap gqaj             Pretifies JSON under cursor
  nmap gwaj             Takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
"}}}

" Text objects & Motions {{{
  cnoremap <expr> %%      getcmdtype() == ':' ? expand('%:h').'/' : '%%'                 " Expand HOME path on command

  onoremap ie             <cmd>exec "normal! ggVG"<cr>|                                  " Text object for whole buffer
  onoremap iv             <cmd>exec "normal! HVL"<cr>|                                   " Text object for whole view
  xnoremap iz             <cmd>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>|           " Text object for inside fold
  xnoremap az             <cmd>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>]           " Text object for arround fold
  xnoremap ih             <cmd>lua require('gitsigns').select_hunk()<cr>|                  " Text object for inside hunk (git mod.)
  onoremap ih             <cmd>lua require('gitsigns').select_hunk()<cr>|                  " Text object for inside hunk (git mod.)
  " onoremap [iIaA] [nl_] (){}B[]<>t'`",.;:+-=~_*#/|\&$a Text objects for any of those (t=tag, a=argument)
  " onoremap [ia] iI        Text objects for indentation level
  " onoremap [ia]j          Text objects for Json

  nmap sp                 <plug>(SubversiveSubstitute)                                   " Replace next text object with yank content
  nmap sD                 <plug>(SubversiveSubstituteLine)                               " Replace line with yank content
  nmap sC                 <plug>(SubversiveSubstituteToEndOfLine)                        " Replase till EOL with yank content
  " nmap [cdy]s             Change,delete,add surround: accepts text object + 1 or 2 brackets
  " nmap g[lL]              left,right tabulate: accepts text object + 1 character
  " nmap ga                 Aligns around given char: accepts text object [1-9] or * or ** + 1 character (<space>=:.|&#,)
"}}}
