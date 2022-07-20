-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dani/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dani/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  FastFold = {
    config = { "\27LJ\2\nΩ\2\0\0\4\0\3\0\0066\0\0\0009\0\1\0'\2\2\0+\3\1\0B\0\3\1K\0\1\0ì\2          let g:fastfold_savehook = 1\n          function! FoldConfig()\n            set foldmethod=expr\n            set foldexpr=nvim_treesitter#foldexpr()\n          endfunction\n          autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()\n        \14nvim_exec\bapi\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/FastFold",
    url = "https://github.com/Konfekt/FastFold"
  },
  FoldText = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/FoldText",
    url = "https://github.com/Konfekt/FoldText"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nN\0\4\f\0\4\0\r'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\5Ä\a\b\2\0X\n\3Ä\18\n\4\0'\v\3\0&\4\v\nF\b\3\3R\b˘L\4\2\0\tÔÅó \nerror\npairs\6 ¨\3\0\0\v\0\17\1B4\0\0\0006\1\0\0009\1\1\1)\3\0\0'\4\2\0B\1\3\0026\2\0\0009\2\1\2)\4\0\0'\5\3\0B\2\3\0026\3\0\0009\3\1\3)\5\0\0'\6\4\0B\3\3\0026\4\0\0009\4\1\4)\6\0\0'\a\5\0B\4\3\2\b\1\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\t\0'\t\b\0\18\n\1\0&\t\n\t=\t\n\bB\5\3\1\b\2\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\f\0'\t\v\0\18\n\2\0&\t\n\t=\t\n\bB\5\3\1\b\4\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\14\0'\t\r\0\18\n\4\0&\t\n\t=\t\n\bB\5\3\1\b\3\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\16\0'\t\15\0\18\n\3\0&\t\n\t=\t\n\bB\5\3\1L\0\2\0\1\0\1\nguifg\f#7EA9A7\n ÔÑ© \1\0\1\nguifg\f#A3BA5E\n Ôäú \1\0\1\nguifg\f#EFB839\n Ôî© \ttext\1\0\1\nguifg\f#EC5241\n Ôôô \vinsert\ntable\tHint\16Information\fWarning\nError\bget\15diagnostic\0À\5\1\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0003\4\4\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\t\0003\5\b\0=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\26diagnostics_indicator\0\1\0\24\fsort_by\aid\23left_mouse_command\14buffer %d\22show_buffer_icons\2\fnumbers\tnone\24show_tab_indicators\2\20separator_style\tthin\25enforce_regular_tabs\1\27always_show_bufferline\2\rtab_size\3\24\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\tmode\fbuffers\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\24persist_buffer_sort\2\19indicator_icon\b‚ñé\20show_close_icon\1\28show_buffer_close_icons\1\16diagnostics\rnvim_lsp\24right_mouse_command\16Bdelete! %d\18close_command\16Bdelete! %d\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  clip = {
    config = { "\27LJ\2\nè\3\0\0\6\0\19\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\b\0025\3\t\0=\3\n\0025\3\16\0005\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\3\17paste_behind\f<C-S-v>\vselect\t<cr>\npaste\t<cr>\6i\1\0\0\1\0\3\17paste_behind\f<C-S-v>\vselect\t<cr>\npaste\t<cr>\ron_paste\1\0\1\fset_reg\1\fdb_path\21/neoclip.sqlite3\tdata\fstdpath\afn\1\0\5\25enable_macro_history\1\fpreview\2\30enable_persistent_history\2\fhistory\3Ë\a\24content_spec_colunm\1\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/clip",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-fuzzy-buffer"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    after_files = { "/home/dani/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    cond = { "\27LJ\2\n5\0\0\1\0\2\0\b6\0\0\0009\0\1\0\v\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\14NVIM_TMUX\benv\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    cond = { "\27LJ\2\n4\0\0\1\0\2\0\b6\0\0\0009\0\1\0\v\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rNVIM_GUI\benv\0" },
    config = { "\27LJ\2\nß\1\0\0\3\0\a\0\r6\0\0\0'\1\2\0=\1\1\0006\0\0\0)\1\1\0=\1\3\0006\0\0\0)\1\0\0=\1\4\0006\0\5\0'\2\6\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd,gruvbox_material_disable_italic_comment\19gruvbox_italic\thard\26gruvbox_contrast_dark\6g\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopVVertical" },
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  icons = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/icons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÄ\4\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0%indent_blankline_buftype_exclude\1\2\0\0\rterminal&indent_blankline_context_patterns\1\6\0\0\nclass\rfunction\vmethod\b^if\t^for\1\0\n\25show_current_context\2*indent_blankline_show_current_context\2#indent_blankline_show_foldtext\0024indent_blankline_show_trailing_blankline_indent\2&indent_blankline_show_end_of_line\2$indent_blankline_use_treesitter\2 indent_blankline_space_char\6.\26indent_blankline_char\b‚îÇ\21show_end_of_line\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n˝\4\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\3\25always_divide_middle\2\ntheme\17gruvbox_dark\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\ní\2\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0005\4\6\0=\4\a\3=\3\b\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\t\0B\0\1\1K\0\1\0\venable\14fast_wrap\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\4\bmap\n<M-\">\16check_comma\2\15hightlight\vSearch\fend_key\6$\14ts_config\1\0\3\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n§\1\0\0\n\0\a\1\0224\0\0\0006\1\0\0006\3\1\0009\3\2\3B\3\1\0A\1\0\4X\4\fÄ6\6\1\0009\6\3\6\18\b\5\0'\t\4\0B\6\3\2\6\6\5\0X\a\5Ä\6\6\6\0X\a\3Ä\21\a\0\0\22\a\0\a<\5\a\0E\4\3\3R\4ÚL\0\2\0\vprompt\vnofile\fbuftype\24nvim_buf_get_option\19nvim_list_bufs\bapi\vipairs\0022\0\1\4\0\3\0\0056\1\0\0009\1\1\0019\3\2\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn:\0\2\4\1\3\0\a-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2=\2\0\1L\1\2\0\2¿\fdefault\fpresets\tkindë\f\1\0\r\0I\0ä\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2B\2\1\0A\0\0\0026\1\0\0'\3\6\0B\1\2\0026\2\a\0006\4\b\0B\2\2\4X\5\5Ä8\a\6\0019\a\t\a5\t\n\0=\0\v\tB\a\2\1E\5\3\3R\5˘6\2\0\0'\4\f\0B\2\2\0029\3\r\0025\5\14\0005\6\15\0=\6\16\5B\3\2\0016\3\0\0'\5\17\0B\3\2\0029\4\t\0035\6$\0005\a\20\0009\b\18\0039\b\19\b)\n¸ˇB\b\2\2=\b\21\a9\b\18\0039\b\19\b)\n\4\0B\b\2\2=\b\22\a9\b\18\0039\b\23\bB\b\1\2=\b\24\a9\b\18\0039\b\25\bB\b\1\2=\b\26\a9\b\18\0039\n\18\0039\n\27\nB\n\1\0025\v\28\0B\b\3\2=\b\29\a9\b\18\0039\n\18\0039\n\30\nB\n\1\0025\v\31\0B\b\3\2=\b \a9\b\18\0039\b!\b5\n\"\0B\b\2\2=\b#\a=\a\18\0064\a\0\0=\a%\0069\a&\0039\a'\a4\t\a\0005\n(\0005\v)\0=\v*\n>\n\1\t5\n+\0>\n\2\t5\n,\0>\n\3\t5\n-\0>\n\4\t5\n.\0>\n\5\t5\n/\0005\v1\0003\f0\0=\f2\v=\v3\n>\n\6\tB\a\2\2=\a'\0065\a5\0003\b4\0=\b6\a=\a7\0065\a9\0003\b8\0=\b:\a=\a;\6B\4\2\0019\4\t\0039\4<\4'\6=\0005\a?\0009\b\18\0039\b>\b9\b<\bB\b\1\2=\b\18\a4\b\3\0005\t@\0>\t\1\b=\b'\aB\4\3\0016\4\0\0'\6A\0B\4\2\0029\5B\3\18\a\5\0009\5C\5'\bD\0009\tE\0045\vG\0005\fF\0=\fH\vB\t\2\0A\5\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\1\0\1\tname\17fuzzy_buffer\1\0\0\vpreset\6/\fcmdline\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\foptions\15get_bufnrs\1\0\0\0\1\0\1\tname\17fuzzy_buffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\14ultisnips\1\0\1\tname\15treesitter\1\0\1\tname\ttmux\voption\1\0\1\19trailing_slash\2\1\0\1\tname\tpath\fsources\vconfig\vwindow\1\0\0\t<cr>\1\0\1\vselect\2\fconfirm\f<S-tab>\1\3\0\0\6i\6s\21select_prev_item\n<tab>\1\3\0\0\6i\6s\21select_next_item\14<C-enter>\nclose\14<C-space>\rcomplete\n<C-k>\n<C-j>\1\0\0\16scroll_docs\fmapping\bcmp\15symbol_map\1\0\25\rConstant\bÔ£æ\tEnum\bÔÖù\vStruct\bÔ≠Ñ\nValue\bÔ¢ü\nEvent\bÔÉß\tUnit\bÔ•¨\rProperty\bÔ∞†\rOperator\bÔöî\vModule\bÔíá\18TypeParameter\5\14Interface\bÔÉ®\nClass\bÔ¥Ø\rVariable\bÔî™\nField\bÔ∞†\16Constructor\bÔê£\15EnumMember\bÔÖù\rFunction\bÔûî\vFolder\bÔùä\vMethod\bÔö¶\14Reference\bÔúÜ\tText\bÔùæ\tFile\bÔúò\nColor\bÔ£ó\fSnippet\bÔëè\fKeyword\bÔ†ä\1\0\2\tmode\16symbol_text\vpreset\rcodicons\tinit\flspkind\17capabilities\1\0\0\nsetup\16lsp_servers\vipairs\14lspconfig\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-cmp" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-hint-textobject"] = {
    config = { "\27LJ\2\nW\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0=\1\3\0K\0\1\0\1\n\0\0\6h\6j\6f\6d\6n\6v\6s\6l\6a\14hint_keys\vconfig\ttsht\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/nvim-ts-hint-textobject",
    url = "https://github.com/mfussenegger/nvim-ts-hint-textobject"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  nvim_context_vt = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\20nvim_context_vt\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rooter.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\techo\1\nsetup\vrooter\frequire\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/rooter.nvim",
    url = "https://github.com/oberblastmeister/rooter.nvim"
  },
  snips = {
    after = { "nvim-cmp" },
    loaded = true,
    only_config = true
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["suda.vim"] = {
    commands = { "SudaRead", "SudaWrite" },
    config = { "\27LJ\2\n)\0\0\2\0\2\0\0046\0\0\0)\1\1\0=\1\1\0K\0\1\0\20suda_smart_edit\6g\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  tabular = {
    after_files = { "/home/dani/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    load_after = {
      ["vim-markdown"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  taskwiki = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/taskwiki",
    url = "https://github.com/tools-life/taskwiki"
  },
  telescope = {
    after = { "zk-nvim" },
    loaded = true,
    only_config = true
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  treesitter = {
    after = { "nvim_context_vt", "nvim-cmp", "nvim-treesitter-refactor", "nvim-treesitter-textobjects", "nvim-ts-rainbow", "nvim-ts-context-commentstring" },
    loaded = true,
    only_config = true
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermNew", "FloatermRepl" },
    config = { "\27LJ\2\né\2\0\0\4\0\r\1\0246\0\0\0*\1\0\0=\1\1\0006\0\0\0*\1\0\0=\1\2\0006\0\0\0'\1\4\0=\1\3\0006\0\0\0)\1\1\0=\1\5\0006\0\0\0006\1\a\0009\1\b\1'\3\t\0B\1\2\2'\2\n\0&\1\2\1=\1\6\0006\0\v\0'\2\f\0B\0\2\1K\0\1\0\31hi FloatermNC guibg = gray\bcmd\20/repl-runner.sh\tdata\fstdpath\afn\25floaterm_repl_runner\23floaterm_autoclose\tedit\20floaterm_opener\20floaterm_height\19floaterm_width\6gµÊÃô\19ô≥¶ˇ\3\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-lion"] = {
    config = { "\27LJ\2\n~\0\0\2\0\a\0\r6\0\0\0)\1\1\0=\1\1\0006\0\2\0)\1\1\0=\1\1\0006\0\2\0'\1\4\0=\1\3\0006\0\2\0'\1\6\0=\1\5\0K\0\1\0\v<M-t>h\18lion_map_left\v<M-t>l\19lion_map_right\6g\24lion_squeeze_spaces\6b\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-markdown"] = {
    after = { "tabular" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-move"] = {
    config = { "\27LJ\2\nV\0\0\2\0\4\0\a6\0\0\0'\1\2\0=\1\1\0006\0\0\0'\1\2\0=\1\3\0K\0\1\0!move_key_modifier_visualmode\6C\22move_key_modifier\6g\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-pandoc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n“\b\0\0\4\0\3\0\0066\0\0\0009\0\1\0'\2\2\0+\3\1\0B\0\3\1K\0\1\0®\b          function! s:gitModified()\n              let files = systemlist('git ls-files -m 2>/dev/null')\n              return map(files, \"{'line': v:val, 'path': v:val}\")\n          endfunction\n          function! s:gitUntracked()\n              let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')\n              return map(files, \"{'line': v:val, 'path': v:val}\")\n          endfunction\n\n          let g:startify_lists = [\n            \\ { 'type': 'files',                    'header': ['   MRU']            },\n            \\ { 'type': 'sessions',                 'header': ['   Sessions']       },\n            \\ { 'type': 'bookmarks',                'header': ['   Bookmarks']      },\n            \\ { 'type': function('s:gitModified'),  'header': ['   git modified']   },\n            \\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']  },\n            \\ { 'type': 'commands',                 'header': ['   Commands']       },\n          \\ ]\n          let g:startify_session_dir = expand(stdpath('data').'/sessions')\n        \14nvim_exec\bapi\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-stay"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-stay",
    url = "https://github.com/zhimsel/vim-stay"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-taskwarrior"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-taskwarrior",
    url = "https://github.com/blindFS/vim-taskwarrior"
  },
  ["vim-tmux-clipboard"] = {
    cond = { "\27LJ\2\n5\0\0\1\0\2\0\b6\0\0\0009\0\1\0\v\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\14NVIM_TMUX\benv\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/vim-tmux-clipboard",
    url = "https://github.com/roxma/vim-tmux-clipboard"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\2\n4\0\0\2\0\2\0\0046\0\0\0)\1\1\0=\1\1\0K\0\1\0\31tmux_navigator_no_mappings\6g\0" },
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/bronson/vim-visual-star-search"
  },
  zenburn = {
    cond = { "\27LJ\2\n4\0\0\1\0\2\0\b6\0\0\0009\0\1\0\n\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rNVIM_GUI\benv\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24colorscheme zenburn\bcmd\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/zenburn",
    url = "https://github.com/jnurmine/zenburn"
  },
  ["zk-nvim"] = {
    config = { "\27LJ\2\n∞\t\0\0\6\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\v\4=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0'\2\16\0+\3\1\0B\0\3\1K\0\1\0 \a        let g:vim_markdown_strikethrough = 1\n        let g:pandoc#syntax#conceal#urls = 1\n\n        augroup pandoc_syntax\n            autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc\n        augroup end\n\n        function! s:isAtStartOfLine(mapping)\n          let text_before_cursor = getline('.')[0 : col('.')-1]\n          let mapping_pattern = '\\V' . escape(a:mapping, '\\')\n          let comment_pattern = '\\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\\')\n          return (text_before_cursor =~? '^' . ('\\v(' . comment_pattern . '\\v)?') . '\\s*\\v' . mapping_pattern . '\\v$')\n        endfunction\n        inoreabbrev <expr> <bar><bar>\n                  \\ <SID>isAtStartOfLine('\\|\\|') ?\n                  \\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'\n        inoreabbrev <expr> __\n                  \\ <SID>isAtStartOfLine('__') ?\n                  \\ '<c-o>:silent! TableModeDisable<cr>' : '__'\n      \14nvim_exec\bapi\blsp\16auto_attach\14filetypes\1\2\0\0\rmarkdown\1\0\1\fenabled\2\vconfig\1\0\0\bcmd\1\0\1\tname\azk\1\3\0\0\azk\blsp\1\0\1\vpicker\14telescope\nsetup\azk\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dani/.local/share/nvim/site/pack/packer/opt/zk-nvim",
    url = "https://github.com/mickael-menu/zk-nvim"
  },
  ["zoomwintab.vim"] = {
    loaded = true,
    path = "/home/dani/.local/share/nvim/site/pack/packer/start/zoomwintab.vim",
    url = "https://github.com/troydm/zoomwintab.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-move
time([[Config for vim-move]], true)
try_loadstring("\27LJ\2\nV\0\0\2\0\4\0\a6\0\0\0'\1\2\0=\1\1\0006\0\0\0'\1\2\0=\1\3\0K\0\1\0!move_key_modifier_visualmode\6C\22move_key_modifier\6g\0", "config", "vim-move")
time([[Config for vim-move]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\2\n4\0\0\2\0\2\0\0046\0\0\0)\1\1\0=\1\1\0K\0\1\0\31tmux_navigator_no_mappings\6g\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: telescope
time([[Config for telescope]], true)
try_loadstring("\27LJ\2\n˚\a\0\0\t\0002\1[6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3'\0005\4\27\0006\5\24\0009\5\25\5'\a\26\0B\5\2\2=\5\28\0045\5\29\0=\5\30\0045\5\"\0006\6\31\0009\6 \6'\a!\0&\6\a\6=\6#\0056\6\24\0009\6\25\6'\b$\0B\6\2\2=\6%\5=\5&\4=\4(\0035\4)\0=\4*\0034\4\3\0006\5\0\0'\a+\0B\5\2\0029\5,\0054\a\0\0B\5\2\0?\5\0\0=\4-\3=\3.\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0/\0'\2(\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0/\0'\2*\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0/\0'\0020\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0/\0'\2-\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0/\0'\0021\0B\0\2\1K\0\1\0\fneoclip\trepo\19load_extension\15extensions\14ui-select\17get_dropdown\21telescope.themes\bfzf\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\rfrecency\1\0\0\15workspaces\tconf\vconfig\tproj\1\0\0\14/Projects\tHOME\benv\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\fdb_root\1\0\3\19show_unindexed\2\16show_scores\2\21disable_devicons\1\tdata\fstdpath\afn\fpickers\16diagnostics\1\0\1\ntheme\rdropdown\15git_status\1\0\1\ntheme\rdropdown\fbuiltin\1\0\1\ntheme\rdropdown\fbuffers\1\0\1\ntheme\rdropdown\19lsp_references\1\0\1\ntheme\rdropdown\19search_history\1\0\1\ntheme\rdropdown\20command_history\1\0\1\ntheme\rdropdown\14registers\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\1\0\1\18prompt_prefix\nüîç \nsetup\14telescope\frequire\3ÄÄ¿ô\4\0", "config", "telescope")
time([[Config for telescope]], false)
-- Config for: snips
time([[Config for snips]], true)
try_loadstring("\27LJ\2\nì\1\0\0\2\0\a\0\n6\0\0\0'\1\2\0=\1\1\0006\0\0\0'\1\4\0=\1\3\0006\0\0\0'\1\6\0=\1\5\0K\0\1\0\n<c-b>!UltiSnipsJumpBackwardTrigger\n<c-n> UltiSnipsJumpForwardTrigger\n<tab>\27UltiSnipsExpandTrigger\6g\0", "config", "snips")
time([[Config for snips]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nN\0\4\f\0\4\0\r'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\5Ä\a\b\2\0X\n\3Ä\18\n\4\0'\v\3\0&\4\v\nF\b\3\3R\b˘L\4\2\0\tÔÅó \nerror\npairs\6 ¨\3\0\0\v\0\17\1B4\0\0\0006\1\0\0009\1\1\1)\3\0\0'\4\2\0B\1\3\0026\2\0\0009\2\1\2)\4\0\0'\5\3\0B\2\3\0026\3\0\0009\3\1\3)\5\0\0'\6\4\0B\3\3\0026\4\0\0009\4\1\4)\6\0\0'\a\5\0B\4\3\2\b\1\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\t\0'\t\b\0\18\n\1\0&\t\n\t=\t\n\bB\5\3\1\b\2\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\f\0'\t\v\0\18\n\2\0&\t\n\t=\t\n\bB\5\3\1\b\4\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\14\0'\t\r\0\18\n\4\0&\t\n\t=\t\n\bB\5\3\1\b\3\0\0X\5\tÄ6\5\6\0009\5\a\5\18\a\0\0005\b\16\0'\t\15\0\18\n\3\0&\t\n\t=\t\n\bB\5\3\1L\0\2\0\1\0\1\nguifg\f#7EA9A7\n ÔÑ© \1\0\1\nguifg\f#A3BA5E\n Ôäú \1\0\1\nguifg\f#EFB839\n Ôî© \ttext\1\0\1\nguifg\f#EC5241\n Ôôô \vinsert\ntable\tHint\16Information\fWarning\nError\bget\15diagnostic\0À\5\1\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0003\4\4\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\t\0003\5\b\0=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\26diagnostics_indicator\0\1\0\24\fsort_by\aid\23left_mouse_command\14buffer %d\22show_buffer_icons\2\fnumbers\tnone\24show_tab_indicators\2\20separator_style\tthin\25enforce_regular_tabs\1\27always_show_bufferline\2\rtab_size\3\24\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\tmode\fbuffers\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\24persist_buffer_sort\2\19indicator_icon\b‚ñé\20show_close_icon\1\28show_buffer_close_icons\1\16diagnostics\rnvim_lsp\24right_mouse_command\16Bdelete! %d\18close_command\16Bdelete! %d\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÄ\4\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0%indent_blankline_buftype_exclude\1\2\0\0\rterminal&indent_blankline_context_patterns\1\6\0\0\nclass\rfunction\vmethod\b^if\t^for\1\0\n\25show_current_context\2*indent_blankline_show_current_context\2#indent_blankline_show_foldtext\0024indent_blankline_show_trailing_blankline_indent\2&indent_blankline_show_end_of_line\2$indent_blankline_use_treesitter\2 indent_blankline_space_char\6.\26indent_blankline_char\b‚îÇ\21show_end_of_line\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: treesitter
time([[Config for treesitter]], true)
try_loadstring("\27LJ\2\nÖ\v\0\0\6\0003\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\21\0005\4\20\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0005\5\26\0=\5\n\4=\4\27\0035\4\28\0005\5\29\0=\5\n\4=\4\30\3=\3\31\0025\3\"\0005\4 \0005\5!\0=\5\n\4=\4#\0035\4$\0005\5%\0=\5&\0045\5'\0=\5(\4=\4)\0035\4*\0005\5+\0=\5,\0045\5-\0=\5.\4=\4/\3=\0030\0025\0031\0=\0032\2B\0\2\1K\0\1\0\fmatchup\1\0\2\venable\2\25disable_virtual_text\2\16textobjects\tswap\18swap_previous\1\0\2\f<M-S-s>\21@statement.inner\f<M-S-a>\21@parameter.inner\14swap_next\1\0\2\n<M-s>\21@statement.inner\n<M-a>\21@parameter.inner\1\0\1\venable\2\tmove\24goto_previous_start\1\0\2\b<(>\21@statement.outer\bM-(\20@function.outer\20goto_next_start\1\0\2\bM-)\20@function.outer\b<)>\21@statement.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\t\aac\19@comment.outer\aas\21@statement.outer\aia\21@parameter.inner\aic\19@comment.inner\aaa\21@parameter.outer\aab\17@block.outer\aaf\20@function.outer\aib\17@block.inner\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\rrefactor\15navigation\1\0\3\24goto_previous_usage\n<M-m>\20goto_next_usage\n<M-n>\20goto_definition\n<M-d>\1\0\1\venable\2\17smart_rename\1\0\1\17smart_rename\n<M-r>\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\14autopairs\1\0\1\venable\2\frainbow\1\0\2\venable\2\18extended_mode\2\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\vemable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\n<M-v>\22scope_incremental\n<M-c>\19init_selection\n<M-v>\21node_decremental\f<M-S-v>\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\1\17auto_install\2\1\a\0\0\vpython\tbash\rmarkdown\tjson\tyaml\blua\nsetup\28nvim-treesitter.configs\frequire\0", "config", "treesitter")
time([[Config for treesitter]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\n“\b\0\0\4\0\3\0\0066\0\0\0009\0\1\0'\2\2\0+\3\1\0B\0\3\1K\0\1\0®\b          function! s:gitModified()\n              let files = systemlist('git ls-files -m 2>/dev/null')\n              return map(files, \"{'line': v:val, 'path': v:val}\")\n          endfunction\n          function! s:gitUntracked()\n              let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')\n              return map(files, \"{'line': v:val, 'path': v:val}\")\n          endfunction\n\n          let g:startify_lists = [\n            \\ { 'type': 'files',                    'header': ['   MRU']            },\n            \\ { 'type': 'sessions',                 'header': ['   Sessions']       },\n            \\ { 'type': 'bookmarks',                'header': ['   Bookmarks']      },\n            \\ { 'type': function('s:gitModified'),  'header': ['   git modified']   },\n            \\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']  },\n            \\ { 'type': 'commands',                 'header': ['   Commands']       },\n          \\ ]\n          let g:startify_session_dir = expand(stdpath('data').'/sessions')\n        \14nvim_exec\bapi\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: rooter.nvim
time([[Config for rooter.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\techo\1\nsetup\vrooter\frequire\0", "config", "rooter.nvim")
time([[Config for rooter.nvim]], false)
-- Config for: FastFold
time([[Config for FastFold]], true)
try_loadstring("\27LJ\2\nΩ\2\0\0\4\0\3\0\0066\0\0\0009\0\1\0'\2\2\0+\3\1\0B\0\3\1K\0\1\0ì\2          let g:fastfold_savehook = 1\n          function! FoldConfig()\n            set foldmethod=expr\n            set foldexpr=nvim_treesitter#foldexpr()\n          endfunction\n          autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()\n        \14nvim_exec\bapi\0", "config", "FastFold")
time([[Config for FastFold]], false)
-- Config for: clip
time([[Config for clip]], true)
try_loadstring("\27LJ\2\nè\3\0\0\6\0\19\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\b\0025\3\t\0=\3\n\0025\3\16\0005\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\3\17paste_behind\f<C-S-v>\vselect\t<cr>\npaste\t<cr>\6i\1\0\0\1\0\3\17paste_behind\f<C-S-v>\vselect\t<cr>\npaste\t<cr>\ron_paste\1\0\1\fset_reg\1\fdb_path\21/neoclip.sqlite3\tdata\fstdpath\afn\1\0\5\25enable_macro_history\1\fpreview\2\30enable_persistent_history\2\fhistory\3Ë\a\24content_spec_colunm\1\nsetup\fneoclip\frequire\0", "config", "clip")
time([[Config for clip]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\ní\2\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0005\4\6\0=\4\a\3=\3\b\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\t\0B\0\1\1K\0\1\0\venable\14fast_wrap\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\4\bmap\n<M-\">\16check_comma\2\15hightlight\vSearch\fend_key\6$\14ts_config\1\0\3\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nû\2\0\0\5\0\f\0\0226\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0005\2\4\0006\3\5\0=\3\6\0025\3\b\0005\4\a\0=\4\t\3=\3\n\2B\0\2\0016\0\0\0'\2\v\0B\0\2\0029\0\3\0004\2\0\0B\0\2\1K\0\1\0\18lsp_signature\aui\nicons\1\0\0\1\0\3\23server_uninstalled\b‚úó\19server_pending\b‚ûú\21server_installed\b‚úì\21ensure_installed\16lsp_servers\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-ts-hint-textobject
time([[Config for nvim-ts-hint-textobject]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\4\0=\1\3\0K\0\1\0\1\n\0\0\6h\6j\6f\6d\6n\6v\6s\6l\6a\14hint_keys\vconfig\ttsht\frequire\0", "config", "nvim-ts-hint-textobject")
time([[Config for nvim-ts-hint-textobject]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: vim-lion
time([[Config for vim-lion]], true)
try_loadstring("\27LJ\2\n~\0\0\2\0\a\0\r6\0\0\0)\1\1\0=\1\1\0006\0\2\0)\1\1\0=\1\1\0006\0\2\0'\1\4\0=\1\3\0006\0\2\0'\1\6\0=\1\5\0K\0\1\0\v<M-t>h\18lion_map_left\v<M-t>l\19lion_map_right\6g\24lion_squeeze_spaces\6b\0", "config", "vim-lion")
time([[Config for vim-lion]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n˝\4\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\3\25always_divide_middle\2\ntheme\17gruvbox_dark\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Conditional loads
time([[Conditional loading of zenburn]], true)
  require("packer.load")({"zenburn"}, {}, _G.packer_plugins)
time([[Conditional loading of zenburn]], false)
time([[Conditional loading of vim-tmux-clipboard]], true)
  require("packer.load")({"vim-tmux-clipboard"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-tmux-clipboard]], false)
time([[Conditional loading of cmp-tmux]], true)
  require("packer.load")({"cmp-tmux"}, {}, _G.packer_plugins)
time([[Conditional loading of cmp-tmux]], false)
time([[Conditional loading of gruvbox.nvim]], true)
  require("packer.load")({"gruvbox.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gruvbox.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim_context_vt ]]

-- Config for: nvim_context_vt
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\20nvim_context_vt\frequire\0", "config", "nvim_context_vt")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n§\1\0\0\n\0\a\1\0224\0\0\0006\1\0\0006\3\1\0009\3\2\3B\3\1\0A\1\0\4X\4\fÄ6\6\1\0009\6\3\6\18\b\5\0'\t\4\0B\6\3\2\6\6\5\0X\a\5Ä\6\6\6\0X\a\3Ä\21\a\0\0\22\a\0\a<\5\a\0E\4\3\3R\4ÚL\0\2\0\vprompt\vnofile\fbuftype\24nvim_buf_get_option\19nvim_list_bufs\bapi\vipairs\0022\0\1\4\0\3\0\0056\1\0\0009\1\1\0019\3\2\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn:\0\2\4\1\3\0\a-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2=\2\0\1L\1\2\0\2¿\fdefault\fpresets\tkindë\f\1\0\r\0I\0ä\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2B\2\1\0A\0\0\0026\1\0\0'\3\6\0B\1\2\0026\2\a\0006\4\b\0B\2\2\4X\5\5Ä8\a\6\0019\a\t\a5\t\n\0=\0\v\tB\a\2\1E\5\3\3R\5˘6\2\0\0'\4\f\0B\2\2\0029\3\r\0025\5\14\0005\6\15\0=\6\16\5B\3\2\0016\3\0\0'\5\17\0B\3\2\0029\4\t\0035\6$\0005\a\20\0009\b\18\0039\b\19\b)\n¸ˇB\b\2\2=\b\21\a9\b\18\0039\b\19\b)\n\4\0B\b\2\2=\b\22\a9\b\18\0039\b\23\bB\b\1\2=\b\24\a9\b\18\0039\b\25\bB\b\1\2=\b\26\a9\b\18\0039\n\18\0039\n\27\nB\n\1\0025\v\28\0B\b\3\2=\b\29\a9\b\18\0039\n\18\0039\n\30\nB\n\1\0025\v\31\0B\b\3\2=\b \a9\b\18\0039\b!\b5\n\"\0B\b\2\2=\b#\a=\a\18\0064\a\0\0=\a%\0069\a&\0039\a'\a4\t\a\0005\n(\0005\v)\0=\v*\n>\n\1\t5\n+\0>\n\2\t5\n,\0>\n\3\t5\n-\0>\n\4\t5\n.\0>\n\5\t5\n/\0005\v1\0003\f0\0=\f2\v=\v3\n>\n\6\tB\a\2\2=\a'\0065\a5\0003\b4\0=\b6\a=\a7\0065\a9\0003\b8\0=\b:\a=\a;\6B\4\2\0019\4\t\0039\4<\4'\6=\0005\a?\0009\b\18\0039\b>\b9\b<\bB\b\1\2=\b\18\a4\b\3\0005\t@\0>\t\1\b=\b'\aB\4\3\0016\4\0\0'\6A\0B\4\2\0029\5B\3\18\a\5\0009\5C\5'\bD\0009\tE\0045\vG\0005\fF\0=\fH\vB\t\2\0A\5\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\1\0\1\tname\17fuzzy_buffer\1\0\0\vpreset\6/\fcmdline\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\foptions\15get_bufnrs\1\0\0\0\1\0\1\tname\17fuzzy_buffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\14ultisnips\1\0\1\tname\15treesitter\1\0\1\tname\ttmux\voption\1\0\1\19trailing_slash\2\1\0\1\tname\tpath\fsources\vconfig\vwindow\1\0\0\t<cr>\1\0\1\vselect\2\fconfirm\f<S-tab>\1\3\0\0\6i\6s\21select_prev_item\n<tab>\1\3\0\0\6i\6s\21select_next_item\14<C-enter>\nclose\14<C-space>\rcomplete\n<C-k>\n<C-j>\1\0\0\16scroll_docs\fmapping\bcmp\15symbol_map\1\0\25\rConstant\bÔ£æ\tEnum\bÔÖù\vStruct\bÔ≠Ñ\nValue\bÔ¢ü\nEvent\bÔÉß\tUnit\bÔ•¨\rProperty\bÔ∞†\rOperator\bÔöî\vModule\bÔíá\18TypeParameter\5\14Interface\bÔÉ®\nClass\bÔ¥Ø\rVariable\bÔî™\nField\bÔ∞†\16Constructor\bÔê£\15EnumMember\bÔÖù\rFunction\bÔûî\vFolder\bÔùä\vMethod\bÔö¶\14Reference\bÔúÜ\tText\bÔùæ\tFile\bÔúò\nColor\bÔ£ó\fSnippet\bÔëè\fKeyword\bÔ†ä\1\0\2\tmode\16symbol_text\vpreset\rcodicons\tinit\flspkind\17capabilities\1\0\0\nsetup\16lsp_servers\vipairs\14lspconfig\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-cmp")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bwipeout lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bwipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopVVertical lua require("packer.load")({'hop.nvim'}, { cmd = "HopVVertical", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermNew lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermRepl lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-pandoc-syntax', 'vim-table-mode', 'vim-taskwarrior', 'vim-markdown', 'taskwiki', 'zk-nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/dani/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/dani/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/dani/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
