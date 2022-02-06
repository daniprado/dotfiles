-- Visual {{{
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
                  local error = vim.diagnostic.get(0, [[Error]])
                  local warning = vim.diagnostic.get(0, [[Warning]])
                  local info = vim.diagnostic.get(0, [[Information]])
                  local hint = vim.diagnostic.get(0, [[Hint]])
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

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
-- }}}

-- Navigation {{{
  require('numb').setup()
  require('rooter').setup({ echo = false })
-- }}}

-- Telescope {{{
  require('neoclip').setup({
    history = 1000,
    enable_persistant_history = true,
    db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
    -- FIXME Check why these fail if changed
    enable_macro_history = false,
    content_spec_colunm = false,
    preview = true,
    on_paste = { set_reg = false, },
    -- FIXME end.
    keys = {
      telescope = {
        i = { select = '<CR>', paste = '<CR>', paste_behind = '<C-S-v>', },
        n = { select = '<CR>', paste = '<CR>', paste_behind = '<C-S-v>', },
      },
    },
  })

  local fb_actions = require "telescope".extensions.file_browser.actions
  require('telescope').setup({
    defaults = { prompt_prefix="🔍 ", },
    extensions = {
      frecency = {
        db_root = vim.fn.stdpath("data"),
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*"},
        disable_devicons = false,
        workspaces = {
          ["projects"] = "~/Projects",
          ["conf"]    = vim.fn.stdpath("config"),
          ["wiki"]    = vim.fn.stdpath("data") .. "/vimwiki",
        },
      },
      file_browser = {
        theme = "ivy",
        mappings = {
          i = {
            ["<C-h>"] = fb_actions.goto_home_dir,
          },
          n = {},
        },
      },
    },
  })
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('repo')
  require('telescope').load_extension('neoclip')
  require('telescope').load_extension('session-lens')
-- }}}

-- Hops {{{
  require('hop').setup()
  require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
-- }}}

-- Treesitter {{{
  require('twilight').setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = "maintained",
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<M-v>",
        node_incremental = "<M-v>",
        node_decremental = "<M-S-v>",
        scope_incremental = "<M-c>",
      },
    },
    indent = { emable = true },
    context_commentstring = { enable = true },
    rainbow = { enable = true, extended_mode = true },
    autopairs = { enable = true },
    refactor = {
      highlight_definitions = { enable = true },
      smart_rename = { enable = true, keymaps = { smart_rename = "<M-r>" } },
      navigation = {
        enable = true,
        keymaps = { goto_definition = "<M-d>", goto_next_usage = "<M-n>", goto_previous_usage = "<M-m>", },
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ab"] = "@block.outer", ["ib"] = "@block.inner",
          ["af"] = "@function.outer", ["if"] = "@function.inner",
          ["aa"] = "@parameter.outer", ["ia"] = "@parameter.inner",
          ["ac"] = "@comment.outer", ["ic"] = "@comment.inner",
          ["as"] = "@statement.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = { ["M-)"] = "@function.outer", ["<)>"] = "@statement.outer", },
        goto_previous_start = { ["M-("] = "@function.outer", ["<(>"] = "@statement.outer", },
      },
      swap = {
        enable = true,
        swap_next = { ["<M-a>"] = "@parameter.inner",  ["<M-s>"] = "@statement.inner", },
        swap_previous = { ["<M-S-a>"] = "@parameter.inner",  ["<M-S-s>"] = "@statement.inner", },
      },
    },
  })
-- }}}

-- LSP {{{
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
-- }}}

-- CMP {{{
  require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {},
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
    fast_wrap = {
      map = '<M-">', chars = { '{', '[', '(', '"', "'" }, end_key = '$', check_comma = true, hightlight = 'Search'
    },
  })
  require('nvim-autopairs').enable()

  local lspkind = require('lspkind')
  lspkind.init({
    mode = 'symbol_text',
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
      ['<S-TAB>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
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
-- }}}

-- Sessions {{{
  require('auto-session').setup({
    auto_session_enabled = true,
    auto_session_enable_last_session = false,
    auto_session_create_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  })
  vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

  require('session-lens').setup {
    path_display = {'shorten'},
    theme_conf = { border = false },
    previewer = true
  }
-- }}}

-- Other {{{
  require('gitsigns').setup()
-- }}}

