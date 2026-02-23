-- Treesitter textobjects with new 1.x API
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  event = 'VeryLazy',
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    }

    -- Select keymaps (matching original config)
    local select = require 'nvim-treesitter-textobjects.select'
    vim.keymap.set({ 'x', 'o' }, 'aa', function()
      select.select_textobject('@parameter.outer', 'textobjects')
    end, { desc = 'Select Parameter Outer' })
    vim.keymap.set({ 'x', 'o' }, 'ia', function()
      select.select_textobject('@parameter.inner', 'textobjects')
    end, { desc = 'Select Parameter Inner' })
    vim.keymap.set({ 'x', 'o' }, 'af', function()
      select.select_textobject('@function.outer', 'textobjects')
    end, { desc = 'Select Function Outer' })
    vim.keymap.set({ 'x', 'o' }, 'if', function()
      select.select_textobject('@function.inner', 'textobjects')
    end, { desc = 'Select Function Inner' })
    vim.keymap.set({ 'x', 'o' }, 'ac', function()
      select.select_textobject('@class.outer', 'textobjects')
    end, { desc = 'Select Class Outer' })
    vim.keymap.set({ 'x', 'o' }, 'ic', function()
      select.select_textobject('@class.inner', 'textobjects')
    end, { desc = 'Select Class Inner' })

    -- Swap keymaps (matching original config)
    local swap = require 'nvim-treesitter-textobjects.swap'
    vim.keymap.set('n', '<leader>a', function()
      swap.swap_next '@parameter.inner'
    end, { desc = 'Swap Next Parameter' })
    vim.keymap.set('n', '<leader>A', function()
      swap.swap_previous '@parameter.inner'
    end, { desc = 'Swap Previous Parameter' })

    -- Move keymaps (matching original config)
    local move = require 'nvim-treesitter-textobjects.move'
    vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
      move.goto_next_start('@function.outer', 'textobjects')
    end, { desc = 'Next Function Start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
      move.goto_next_start('@class.outer', 'textobjects')
    end, { desc = 'Next Class Start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
      move.goto_next_end('@function.outer', 'textobjects')
    end, { desc = 'Next Function End' })
    vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
      move.goto_next_end('@class.outer', 'textobjects')
    end, { desc = 'Next Class End' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
      move.goto_previous_start('@function.outer', 'textobjects')
    end, { desc = 'Previous Function Start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
      move.goto_previous_start('@class.outer', 'textobjects')
    end, { desc = 'Previous Class Start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
      move.goto_previous_end('@function.outer', 'textobjects')
    end, { desc = 'Previous Function End' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
      move.goto_previous_end('@class.outer', 'textobjects')
    end, { desc = 'Previous Class End' })
  end,
}
