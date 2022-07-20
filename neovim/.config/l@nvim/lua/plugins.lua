fn = vim.fn
cmd = vim.cmd
env = vim.env
api = vim.api
lsp = vim.lsp
diagnostic = vim.diagnostic
g = vim.g
b = vim.b

lsp_servers = {
  'vimls', 'sumneko_lua', 'pylsp', 'pyright',
  'bashls', 'jsonls', 'terraformls', 'yamlls'
}

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)

  use { 'wbthomason/packer.nvim' }
  use { 'kyazdani42/nvim-web-devicons', as = 'icons' }

  use {
    'troydm/zoomwintab.vim',
    'machakann/vim-highlightedyank',
    'bronson/vim-visual-star-search',
    'kshenoy/vim-signature',
    'zhimsel/vim-stay',
    'tpope/vim-commentary',
    'wellle/targets.vim',
  }

  use {
    { 'mhinz/vim-startify',
      config = function()
        -- TODO
        api.nvim_exec([[
          function! s:gitModified()
              let files = systemlist('git ls-files -m 2>/dev/null')
              return map(files, "{'line': v:val, 'path': v:val}")
          endfunction
          function! s:gitUntracked()
              let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
              return map(files, "{'line': v:val, 'path': v:val}")
          endfunction

          let g:startify_lists = [
            \ { 'type': 'files',                    'header': ['   MRU']            },
            \ { 'type': 'sessions',                 'header': ['   Sessions']       },
            \ { 'type': 'bookmarks',                'header': ['   Bookmarks']      },
            \ { 'type': function('s:gitModified'),  'header': ['   git modified']   },
            \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']  },
            \ { 'type': 'commands',                 'header': ['   Commands']       },
          \ ]
          let g:startify_session_dir = expand(stdpath('data').'/sessions')
        ]], false)
      end,
    },
    { 'Konfekt/FastFold',
      requires = {'Konfekt/FoldText'},
      config = function()
        -- TODO
        api.nvim_exec([[
          let g:fastfold_savehook = 1
          function! FoldConfig()
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
          endfunction
          autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()
        ]], false)
      end,
    },
    { 'tpope/vim-surround', requires = 'tpope/vim-repeat'},
    { 'matze/vim-move',
      config = function()
        g.move_key_modifier = 'C'
        g.move_key_modifier_visualmode = 'C'
      end,
    },
    { 'nacro90/numb.nvim',
      config = function() require('numb').setup() end
    },
    { 'oberblastmeister/rooter.nvim', requires = {'neovim/nvim-lspconfig'},
      config = function() require('rooter').setup({ echo = false }) end
    },
    { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('gitsigns').setup() end,
    },
    { 'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup({
            show_current_context = true,
            show_current_context_start = true,
            show_end_of_line = true,
            indent_blankline_char = '│',
            indent_blankline_space_char = '.',
            indent_blankline_use_treesitter = true,
            indent_blankline_show_end_of_line = true,
            indent_blankline_show_trailing_blankline_indent = true,
            indent_blankline_show_foldtext = true,
            indent_blankline_show_current_context = true,
            indent_blankline_context_patterns = { 'class', 'function', 'method', '^if', '^for' },
            indent_blankline_buftype_exclude = { 'terminal' },
        })
      end
    },
    { 'tommcdo/vim-lion',
      config = function()
        b.lion_squeeze_spaces = 1
        g.lion_squeeze_spaces = 1
        g.lion_map_right = '<M-t>l'
        g.lion_map_left = '<M-t>h'
      end,
    },
    { 'christoomey/vim-tmux-navigator',
      config = function() g.tmux_navigator_no_mappings = 1 end,
    },
  }

  use {
    { 'famiu/bufdelete.nvim',                               opt = true, cmd = {'Bdelete', 'Bwipeout'}},
    { 'mbbill/undotree',                                    opt = true, cmd = {'UndotreeToggle'}},
    { 'lambdalisue/suda.vim',                               opt = true, cmd = {'SudaRead', 'SudaWrite'},
      config = function() g.suda_smart_edit = 1 end,
    },
    { 'voldikss/vim-floaterm',                              opt = true, cmd = {'FloatermNew', 'FloatermRepl'},
      config = function()
        g.floaterm_width = 0.8
        g.floaterm_height = 0.8
        g.floaterm_opener = 'edit'
        g.floaterm_autoclose = 1
        g.floaterm_repl_runner = fn.stdpath('data') .. '/repl-runner.sh'
        cmd('hi FloatermNC guibg = gray')
      end,
    },
    { 'phaazon/hop.nvim',                                   opt = true, cmd = {'HopWord', 'HopLine', 'HopVVertical'},
      branch = 'v2',
      config = function() require('hop').setup() end,
    },
    { 'folke/trouble.nvim',                                 opt = true, cmd = {'TroubleToggle'},
      requires = {'icons'},
      config = function() require('trouble').setup() end,
    },
    { 'roxma/vim-tmux-clipboard',                           opt = true, cond = function() return env.NVIM_TMUX ~= nil end},
  }

-- Colorschemes {{{
  use {
    { 'ellisonleao/gruvbox.nvim',
      opt = true, cond = function() return env.NVIM_GUI ~= nil end,
      config = function()
        g.gruvbox_contrast_dark = 'hard'
        g.gruvbox_italic = 1
        g.gruvbox_material_disable_italic_comment = 0
        cmd('colorscheme gruvbox')
      end,
    },
    { 'jnurmine/zenburn',
      opt = true, cond = function() return env.NVIM_GUI == nil end,
      config = function() cmd('colorscheme zenburn') end,
    },
  }
-- }}}

-- Bufferline {{{
  use { 'akinsho/bufferline.nvim',
    requires = {'icons'},
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'buffers', numbers = 'none',
          middle_mouse_command = nil, left_mouse_command = 'buffer %d',
          close_command = 'Bdelete! %d', right_mouse_command = 'Bdelete! %d',
          diagnostics = 'nvim_lsp', custom_filter = nil,
          indicator_icon = '▎', buffer_close_icon = '', modified_icon = '●',
          close_icon = '', left_trunc_marker = '', right_trunc_marker = '',
          max_name_length = 18, max_prefix_length = 15, tab_size = 24,
          diagnostics_indicator =
            function(count, level, diagnostics_dict, context)
              local s = ' '
              for e, n in pairs(diagnostics_dict) do
                if e == 'error' then s = s .. ' ' end
              end
              return s
            end,
          offsets = {{
            filetype = 'NvimTree', text = 'File Explorer', text_align = 'left'
          }},
          sort_by = 'id', show_buffer_icons = true, show_buffer_close_icons = false,
          show_close_icon = false, show_tab_indicators = true,
          persist_buffer_sort = true, separator_style = 'thin',
          enforce_regular_tabs = false, always_show_bufferline = true,
          custom_areas = {
            right = function()
              local result = {}
              local error = diagnostic.get(0, [[Error]])
              local warning = diagnostic.get(0, [[Warning]])
              local info = diagnostic.get(0, [[Information]])
              local hint = diagnostic.get(0, [[Hint]])
              if error ~= 0 then table.insert(result, {text = '  ' .. error, guifg = '#EC5241'}) end
              if warning ~= 0 then table.insert(result, {text = '  ' .. warning, guifg = '#EFB839'}) end
              if hint ~= 0 then table.insert(result, {text = '  ' .. hint, guifg = '#A3BA5E'}) end
              if info ~= 0 then table.insert(result, {text = '  ' .. info, guifg = '#7EA9A7'}) end
              return result
            end,
          },
        },
      })
    end,
  }
-- }}}

-- VimLine {{{
  use { 'nvim-lualine/lualine.nvim',
    requires = {'icons'},
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'gruvbox_dark',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {'mode'}, lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'}, lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'}, lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {}, lualine_b = {}, lualine_c = {'filename'},
          lualine_x = {'location'}, lualine_y = {}, lualine_z = {}
        },
        tabline = {}, extensions = {}
      })
    end,
  }
-- }}}

-- Telescope {{{
  use { 'AckslD/nvim-neoclip.lua',
    as = 'clip',
    requires = {'kkharji/sqlite.lua', module = 'sqlite'},
    config = function()
      require('neoclip').setup({
        history = 1000, enable_persistent_history = true,
        db_path = fn.stdpath('data') .. '/neoclip.sqlite3',
        enable_macro_history = false, content_spec_colunm = false,
        preview = true, on_paste = { set_reg = false, },
        keys = {
          telescope = {
            i = {select = '<cr>', paste = '<cr>', paste_behind = '<C-S-v>', },
            n = { select = '<cr>', paste = '<cr>', paste_behind = '<C-S-v>', },
          },
        },
      })
    end,
  }

  use { 'nvim-telescope/telescope.nvim',
    as = 'telescope',
    requires = {
      'icons',
      'clip',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      -- {'nvim-lua/popup.nvim', requires = { 'nvim-lua/plenary.nvim' }},
      {'cljoly/telescope-repo.nvim', requires = { 'nvim-lua/plenary.nvim' }},
      {'nvim-telescope/telescope-frecency.nvim',
        requires = {'tami5/sqlite.lua', 'icons'},
      },
      {'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('telescope').setup({
        defaults = { prompt_prefix='🔍 ', },
        pickers = {
          registers = { theme = 'dropdown', },
          command_history = { theme = 'dropdown', },
          search_history = { theme = 'dropdown', },
          lsp_references = { theme = 'dropdown', },
          buffers = {
            theme = 'dropdown',
          },
          builtin = {
            theme = 'dropdown',
          },
          git_status = {
            theme = 'dropdown',
          },
          diagnostics = {
            theme = 'dropdown',
          },
        },
        extensions = {
          frecency = {
            db_root = fn.stdpath('data'),
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = {'*.git/*', '*/tmp/*'},
            disable_devicons = false,
            workspaces = {
              ['proj'] = env.HOME .. '/Projects',
              ['conf'] = fn.stdpath('config'),
            },
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          },
        },
      })
      require('telescope').load_extension('frecency')
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('repo')
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('neoclip')
    end,
  }
-- }}}

-- Treesitter {{{
  use { 'nvim-treesitter/nvim-treesitter',
    as = 'treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed =  {'python', 'bash', 'markdown', 'json', 'yaml', 'lua'},
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<M-v>', node_incremental = '<M-v>',
            node_decremental = '<M-S-v>', scope_incremental = '<M-c>',
          },
        },
        indent = { emable = true },
        context_commentstring = { enable = true },
        rainbow = { enable = true, extended_mode = true },
        autopairs = { enable = true },
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = false },
          smart_rename = { enable = true, keymaps = { smart_rename = '<M-r>' } },
          navigation = {
            enable = true,
            keymaps = { goto_definition = '<M-d>', goto_next_usage = '<M-n>', goto_previous_usage = '<M-m>', },
          },
        },
        textobjects = {
          select = {
            enable = true, lookahead = true,
            keymaps = {
              ['ab'] = '@block.outer', ['ib'] = '@block.inner',
              ['af'] = '@function.outer', ['if'] = '@function.inner',
              ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
              ['ac'] = '@comment.outer', ['ic'] = '@comment.inner',
              ['as'] = '@statement.outer',
            },
          },
          move = {
            enable = true, set_jumps = true,
            goto_next_start = { ['M-)'] = '@function.outer', ['<)>'] = '@statement.outer', },
            goto_previous_start = { ['M-('] = '@function.outer', ['<(>'] = '@statement.outer', },
          },
          swap = {
            enable = true,
            swap_next = { ['<M-a>'] = '@parameter.inner',  ['<M-s>'] = '@statement.inner', },
            swap_previous = { ['<M-S-a>'] = '@parameter.inner',  ['<M-S-s>'] = '@statement.inner', },
          },
        },
        matchup = { enable = true, disable_virtual_text = true, },
      })
    end,
  }
  use {
    { 'JoosepAlviste/nvim-ts-context-commentstring',         after = {'treesitter'}, },
    { 'p00f/nvim-ts-rainbow',                                after = {'treesitter'}, },
    { 'windwp/nvim-autopairs',                               requires = {'treesitter'},
      config = function()
        require('nvim-autopairs').setup({
          check_ts = true, ts_config = {},
          enable_check_bracket_line = false, ignored_next_char = '[%w%.]',
          fast_wrap = {
            map = '<M-">', chars = { '{', '[', '(', '"', "'" },
            end_key = '$', check_comma = true, hightlight = 'Search'
          },
        })
        require('nvim-autopairs').enable()
      end,
    },
    { 'nvim-treesitter/nvim-treesitter-refactor',            after = {'treesitter'}, },
    { 'nvim-treesitter/nvim-treesitter-textobjects',         after = {'treesitter'}, },
    { 'andymass/vim-matchup',                                requires = {'treesitter'}, },
    { 'nvim-treesitter/nvim-treesitter-context',             requires = {'treesitter'},
      config = function()
        require('treesitter-context').setup({ enable = true, })
      end,
    },
    { 'haringsrob/nvim_context_vt',                          after = {'treesitter'},
      config = function()
        require('nvim_context_vt').setup({ enabled = true, })
      end,
    },
    { 'folke/twilight.nvim', opt = true, cmd = {'Twilight'}, requires = {'treesitter'},
      config = function() require('twilight').setup{} end,
    },
    { 'mfussenegger/nvim-ts-hint-textobject',                requires = {'treesitter'},
      config = function()
        require('tsht').config.hint_keys = { 'h', 'j', 'f', 'd', 'n', 'v', 's', 'l', 'a' }
      end,
    },
  }
-- }}}

-- LSP {{{
  use { 'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'ray-x/lsp_signature.nvim',
    },
    config = function()
      require('lspconfig')
      require('nvim-lsp-installer').setup({
        ensure_installed = lsp_servers, automatic_installation = true,
        ui = {icons = {server_installed = '✓', server_pending = '➜', server_uninstalled = '✗'},},
      })
      require('lsp_signature').setup({})
    end,
  }
-- }}}

-- CMP {{{
  use { 'SirVer/ultisnips',
    as = 'snips',
    requires = {'honza/vim-snippets'},
    config = function()
      g.UltiSnipsExpandTrigger = "<tab>"
      g.UltiSnipsJumpForwardTrigger = "<c-n>"
      g.UltiSnipsJumpBackwardTrigger = "<c-b>"
    end,
  }
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      {'andersevenrud/cmp-tmux', opt = true, cond = function() return env.NVIM_TMUX ~= nil end,},
      {'tzachar/cmp-fuzzy-buffer', requires = {'tzachar/fuzzy.nvim'}},
      'ray-x/cmp-treesitter',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
    after = { 'treesitter', 'nvim-lspconfig', 'snips' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp.protocol.make_client_capabilities())
      local lspconfig = require('lspconfig')
      for _, slsp in ipairs(lsp_servers) do
        lspconfig[slsp].setup { capabilities = capabilities }
      end

      local lspkind = require('lspkind')
      lspkind.init({
        mode = 'symbol_text', preset = 'codicons',
        symbol_map = {
          Text = '', Method = '', Function = '', Constructor = '', Field = 'ﰠ', Variable = '', Class = 'ﴯ',
          Interface = '', Module = '', Property = 'ﰠ', Unit = '塞', Value = '', Enum = '', Keyword = '',
          Snippet = '', Color = '', File = '', Reference = '', Folder = '', EnumMember = '', Constant = '',
          Struct = 'פּ', Event = '', Operator = '', TypeParameter = ''
        },
      })

      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<C-j>'] = cmp.mapping.scroll_docs(-4), ['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<C-space>'] = cmp.mapping.complete(), ['<C-enter>'] = cmp.mapping.close(),
          ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
          ['<S-tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
        },
        window = {},
        sources = cmp.config.sources({
          {name = 'path', option = {trailing_slash = true},},
          {name = 'tmux'},
          {name = 'treesitter'},
          {name = 'ultisnips'},
          {name = 'nvim_lsp'},
          {name = 'fuzzy_buffer', options = {
              get_bufnrs = function()
              local bufs = {}
              for _, buf in ipairs(api.nvim_list_bufs()) do
                local buftype = api.nvim_buf_get_option(buf, 'buftype')
                if buftype ~= 'nofile' and buftype ~= 'prompt' then bufs[#bufs + 1] = buf end
              end
              return bufs
              end
          },},
        }),
        snippet = {expand = function(args) fn['UltiSnips#Anon'](args.body) end,},
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
          end
        },
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {{name = 'fuzzy_buffer'},}
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
    end,
  }
-- }}}

-- ZK {{{
  use { 'mickael-menu/zk-nvim',
    requires = {
      {'preservim/vim-markdown', requires = {'godlygeek/tabular'}, opt = true, ft = {'markdown'}},
      {'vim-pandoc/vim-pandoc-syntax', opt = true, ft = {'markdown'}},
      {'dhruvasagar/vim-table-mode', opt = true, ft = {'markdown'}},
      {'tools-life/taskwiki', opt = true, ft = {'markdown'}},
      {'blindFS/vim-taskwarrior', opt = true, ft = {'markdown'}},
    },
    after = { 'telescope' },
    ft = {'markdown'},
    config = function()
      require('zk').setup({
        picker = 'telescope',
        lsp = {
          config = {
            cmd = {'zk', 'lsp'},
            name = 'zk',
          },
          auto_attach = {
            enabled = true,
            filetypes = {'markdown'},
          },
        },
      })
      -- TODO
      api.nvim_exec([[
        let g:vim_markdown_strikethrough = 1
        let g:pandoc#syntax#conceal#urls = 1

        augroup pandoc_syntax
            autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
        augroup end

        function! s:isAtStartOfLine(mapping)
          let text_before_cursor = getline('.')[0 : col('.')-1]
          let mapping_pattern = '\V' . escape(a:mapping, '\')
          let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
          return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
        endfunction
        inoreabbrev <expr> <bar><bar>
                  \ <SID>isAtStartOfLine('\|\|') ?
                  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
        inoreabbrev <expr> __
                  \ <SID>isAtStartOfLine('__') ?
                  \ '<c-o>:silent! TableModeDisable<cr>' : '__'
      ]], false)
    end,
  }
-- }}}

-- Sessions {{{
  -- use { 'rmagatti/auto-session',
  --   requires = {
  --     'rmagatti/session-lens',
  --   },
  --   config = function()
  --     require('auto-session').setup({
  --       auto_session_enabled = true, auto_session_enable_last_session = false,
  --       auto_session_create_enabled = false, auto_save_enabled = true,
  --       auto_restore_enabled = false,
  --       auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  --     })
  --     vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
  --     require('session-lens').setup {
  --       path_display = {'shorten'},
  --       theme_conf = { border = false }, previewer = true
  --     }
  --     require('telescope').load_extension('session-lens')
  --   end,
  -- }
-- }}}

--- Databases {{{
  -- use {'tpope/vim-dadbod',
  --   opt = true, cmd = { 'DBUIToggle' },
  --   requires = {
  --     'tpope/vim-dotenv',
  --     {'kristijanhusak/vim-dadbod-ui',         opt = true},
  --     {'kristijanhusak/vim-dadbod-completion', opt = true},
  --   },
  --   config = function()
  --     g.db_ui_show_help = 0
  --     g.db_ui_disable_mappings = 1
  --     g.db_ui_dotenv_variable_prefix = 'DATABASE_'
  --     g.db_ui_save_location = fn.stdpath('data') .. '/dadbod-ui'
  --     g.db_ui_auto_execute_table_helpers = 1
  --     -- TODO
  --     api.nvim_exec([[
  --       augroup db_config
  --         autocmd FileType dbui nmap <buffer> <Enter> <Plug>(DBUI_SelectLine)
  --         autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine)
  --         autocmd FileType dbui nmap <buffer> R <Plug>(DBUI_Redraw)
  --         autocmd FileType dbui nmap <buffer> W <Plug>(DBUI_SaveQuery)
  --         autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
  --       augroup end
  --     ]], false)
  --   end,
  -- }
--}}}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
