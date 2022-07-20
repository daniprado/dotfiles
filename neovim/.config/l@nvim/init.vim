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

"LUA config {{{
  lua require('plugins')
"}}}

"Functions {{{
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end

  com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

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

"REMOVE {{{
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  let g:wordmotion_uppercase_spaces = ['-']
"}}}

"General config {{{
  syntax enable

  syntax on
  set ruler
  set relativenumber                       "Line numbers are relative
  set number                               "Display the absolute line number at the line you're on
  set ls=2                                 "Always show status bar
  set t_Co=256                             "256 colors on console
  if (has('termguicolors'))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
  endif
  set visualbell
  set viewoptions=cursor,folds,slash,unix

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

  set undofile
  set backup
  set history=1000
  set undoreload=1000
  set undodir=$undodir//
  set directory=$swpdir//
  set backupdir=$bkdir//

  set expandtab
  set tabstop=4
  set shiftwidth=2
  set softtabstop=4
  set autoindent
  set scrolloff=4
  set nu
  set showbreak=↪\
  set listchars=tab:→\ ,eol:↲,trail:•,extends:»,precedes:«,nbsp:‡
  set splitbelow
  set splitright
  set formatoptions+=j

"}}}

"Shortcuts {{{
  let mapleader = "\<space>"
  let g:mapleader = "\<space>"

  cnoremap <EXPR> %%       getcmdtype() == ':' ? expand('%:h').'/' : '%%'
  inoremap <EXPR><TAB>     pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <EXPR><S-TAB>   pumvisible() ? "\<C-p>" : "\<S-TAB>"
  nnoremap <C-M-V>         "+gP
  inoremap <C-M-V>         <C-R>+
  cnoremap <C-M-V>         <C-R>+
  vmap     <C-c>           "+yi
  xnoremap "+y             y:call system("wl-copy", @")<cr>

  cmap w!!                 SudaWrite
  cmap e!!                 SudaRead

  nnoremap <leader>h       <cmd>cd<cr>
  nnoremap <leader>cwd     <cmd>cd %:p:h<cr>:pwd<cr>

  onoremap ie              <cmd>exec "normal! ggVG"<cr>
  onoremap iv              <cmd>exec "normal! HVL"<cr>
  xnoremap ih              <cmd>lua require('gitsigns').select_hunk()<cr>
  onoremap ih              <cmd>lua require('gitsigns').select_hunk()<cr>
  xnoremap iz              <cmd>FastFoldUpdate<cr><ESC>:<C-u>normal! ]zv[z<cr>
  xnoremap az              <cmd>FastFoldUpdate<cr><ESC>:<C-u>normal! ]zV[z<cr>]
  " onoremap [iIaA] [nl_] (){}B[]<>t'`",.;:+-=~_*#/|\&$a Text objects for any of those (t=tag, a=argument)
  " onoremap [ia]j          Text objects for Json

  nnoremap <C-a>           <cmd>exec "normal! ggVG"<cr>
  nnoremap <C-n>           <cmd>BufferLineCycleNext<cr>
  nnoremap <C-b>           <cmd>BufferLineCyclePrev<cr>
  nnoremap <C-w>f          <cmd>ZoomWinTabToggle<cr>
  nnoremap <C-w>k          <cmd>TmuxNavigateUp<cr>
  nnoremap <C-w>j          <cmd>TmuxNavigateDown<cr>
  nnoremap <C-w>h          <cmd>TmuxNavigateLeft<cr>
  nnoremap <C-w>l          <cmd>TmuxNavigateRight<cr>

  nmap     <leader>R       <cmd>source $MYVIMRC<cr>

  nnoremap <leader>v       <C-v>

  nnoremap <leader>ip      <cmd>set invpaste paste?<cr>
  nmap     <leader>lc      <cmd>IndentBlanklineToggle<cr>
  nnoremap <leader>ln      <cmd>set relativenumber!<cr>
  nnoremap <leader>lh      <cmd>call<SID>LongLineHLToggle()<cr>
  nnoremap <leader>lb      <cmd>lua require('gitsigns').toggle_current_line_blame()<cr>
  nnoremap <leader>lt      <cmd>Twilight<cr>

  nnoremap <leader>dt      <cmd>diffthis<cr>
  nnoremap <leader>do      <cmd>diffoff<cr>

  " nnoremap <leader>s       <cmd>Telescope session-lens search_session<cr>
  " nnoremap <leader>S       <cmd>SaveSession<cr>
  nnoremap <leader>u       <cmd>UndotreeToggle<cr>
  nnoremap <leader>p       <cmd>Telescope neoclip<cr>
  nnoremap <leader>"       <cmd>Telescope registers<cr>
  nnoremap <leader>:       <cmd>Telescope command_history<cr>
  nnoremap <leader>/       <cmd>Telescope search_history<cr>
  nnoremap <leader><TAB>   <cmd>Telescope commands<cr>
  nnoremap <leader><S-TAB> <cmd>Telescope keymaps<cr>
  nnoremap <leader><M-TAB> <cmd>Telescope help_tags<cr>
  nnoremap <leader>fb      <cmd>Telescope buffers layout_config.width=0. layout_config.height=0.2<cr>
  nnoremap <leader>fl      <cmd>Telescope current_buffer_fuzzy_find<cr>
  nnoremap <leader>fh      <cmd>Telescope frecency<cr>
  nnoremap <leader>ff      <cmd>FloatermNew broot<cr>
  nnoremap <leader>fif     <cmd>Telescope live_grep<cr>
  nnoremap <leader>F       <cmd>Telescope builtin layout_config.height=085 previewer=false<cr>

  nnoremap <leader>gc      <cmd>Telescope git_commits<cr>
  nnoremap <leader>gC      <cmd>Telescope git_bcommits<cr>
  nnoremap <leader>gst     <cmd>Telescope git_status layout_config.height=0.2<cr>
  nnoremap <leader>gR      <cmd>Telescope repo list<cr>

  nnoremap <leader>wr      <cmd>Telescope lsp_references<cr>
  nnoremap <leader>wi      <cmd>Telescope treesitter<cr>
  nnoremap <leader>ws      <cmd>Telescope lsp_document_symbols<cr>
  nnoremap <leader>wd      <cmd>Telescope diagnostics layout_config.width=0.7<cr>

  nnoremap <leader>zz      <cmd>ZkNotes<cr>
  nnoremap <leader>zf      <cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<cr>
  vnoremap <leader>zf      :'<,'>ZkMatch<cr>
  nnoremap <leader>zl      <cmd>ZkLinks<cr>
  nnoremap <leader>zt      <cmd>ZkTags<cr>

  nnoremap <leader>t       <cmd>FloatermNew<cr>
  vnoremap <leader>t       :FloatermNew<cr>
  nnoremap <leader>tp      <cmd>FloatermNew python<cr>
  vnoremap <leader>tp      :FloatermNew python<cr>
  nnoremap <leader>tb      <cmd>FloatermNew bpytop<cr>
  nnoremap <leader>tg      <cmd>FloatermNew lazygit<cr>

  " nnoremap <leader>bd      <cmd>DBUIToggle<cr>
  " vnoremap <leader><ENTER> :DB<cr>

  nnoremap <leader>x       <cmd>FormatXML<cr>
  nnoremap <leader>j       <cmd>%!python -m json.tool<cr>

  nnoremap <leader>hw      <cmd>HopWord<cr>
  nnoremap <leader>hl      <cmd>HopLine<cr>
  nnoremap <leader>hv      <cmd>HopVertical<cr>
  nnoremap <leader>m       <cmd>lua require('tsht').nodes()<cr>
  vnoremap <leader>m       <cmd>lua require('tsht').nodes()<cr>

  nnoremap <leader>1       <cmd>BufferLineGoToBuffer 1<cr>
  nnoremap <leader>2       <cmd>BufferLineGoToBuffer 2<cr>
  nnoremap <leader>3       <cmd>BufferLineGoToBuffer 3<cr>
  nnoremap <leader>4       <cmd>BufferLineGoToBuffer 4<cr>
  nnoremap <leader>5       <cmd>BufferLineGoToBuffer 5<cr>
  nnoremap <leader>6       <cmd>BufferLineGoToBuffer 6<cr>
  nnoremap <leader>7       <cmd>BufferLineGoToBuffer 7<cr>
  nnoremap <leader>8       <cmd>BufferLineGoToBuffer 8<cr>
  nnoremap <leader>9       <cmd>BufferLineGoToBuffer 9<cr>

  nnoremap <leader>xx      <cmd>TroubleToggle<cr>
  nnoremap <leader>xw      <cmd>TroubleToggle workspace_diagnostics<cr>
  nnoremap <leader>xd      <cmd>TroubleToggle document_diagnostics<cr>
  nnoremap <leader>xq      <cmd>TroubleToggle quickfix<cr>
  nnoremap <leader>xl      <cmd>TroubleToggle loclist<cr>
  nnoremap gR              <cmd>TroubleToggle lsp_references<cr>

  nnoremap <M-g>s          <cmd>lua require('gitsigns').stage_hunk()<cr>
  nnoremap <M-g>u          <cmd>lua require('gitsigns').undo_stage_hunk()<cr>
  nnoremap <M-g>r          <cmd>lua require('gitsigns').reset_hunk()<cr>
  nnoremap <M-g>R          <cmd>lua require('gitsigns').reset_buffer()<cr>
  nnoremap <M-g>p          <cmd>lua require('gitsigns').preview_hunk()<cr>
  nnoremap <M-h>           <cmd>lua require('gitsigns.actions').next_hunk()<cr>
  nnoremap <M-S-h>         <cmd>lua require('gitsigns.actions').prev_hunk()<cr>

  nnoremap <M-l><cr>       <cmd>lua vim.lsp.buf.definition()<cr>
  nnoremap <M-l>h          <cmd>lua vim.lsp.buf.hover()<cr>
  nnoremap <M-l>f          <cmd>lua vim.lsp.buf.formatting()<cr>
  nnoremap <M-l>a          <cmd>lua vim.lsp.buf.code_action()<cr>
  nnoremap <M-l>i          <cmd>lua vim.lsp.buf.implementation()<cr>
  nnoremap <M-l>t          <cmd>lua vim.lsp.buf.type_definition()<cr>
  nnoremap <M-l>d          <cmd>lua vim.lsp.buf.declaration()<cr>
  nnoremap <M-l>r          <cmd>lua vim.lsp.buf.references()<cr>
  vnoremap <M-l>c          :'<,'>lua vim.lsp.buf.range_code_action()<cr>
  nnoremap <M-e>           <cmd>lua vim.diagnostic.goto_next()<cr>
  nnoremap <M-S-e>         <cmd>lua vim.diagnostic.goto_prev()<cr>

  nnoremap <C-M-b>         <cmd>FloatermPrev<cr>
  tnoremap <C-M-b>         <C-\><C-n>:FloatermPrev<cr>
  nnoremap <C-M-n>         <cmd>:FloatermNext<cr>
  tnoremap <C-M-n>         <C-\><C-n>:FloatermNext<cr>
  nnoremap <C-M-t>         <cmd>:FloatermToggle<cr>
  tnoremap <C-M-t>         <C-\><C-n>:FloatermToggle<cr>
"}}}
