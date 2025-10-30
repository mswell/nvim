-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-l>'] = actions.select_default,
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          hidden = true,
        },
        buffers = {
          initial_mode = 'normal',
          sort_lastused = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
              ['l'] = actions.select_default,
            },
          },
        },
      },
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
          return { '--hidden' }
        end,
      },
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      git_files = {
        previewer = false,
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- File pickers
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = 'Recent Files' })

    -- Search pickers
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep (Root Dir)' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Grep Word' })
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Grep Open Files' })
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = 'Search in Buffer' })

    -- Buffer and marks
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Marks' })

    -- Git pickers
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git Files' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gcf', builtin.git_bcommits, { desc = 'Git Commits (Buffer)' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git Status' })

    -- Help and diagnostics
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help Pages' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume' })

    -- LSP document symbols
    vim.keymap.set('n', '<leader>sds', function()
      builtin.lsp_document_symbols {
        symbols = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
      }
    end, { desc = 'Document Symbols' })
  end,
}
