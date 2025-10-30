-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },

  {
    -- Hints keybinds
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<leader>b', group = 'buffer', icon = '' },
        { '<leader>c', group = 'code', icon = '' },
        { '<leader>d', group = 'diagnostics/debug', icon = '' },
        { '<leader>f', group = 'find/file', icon = '' },
        { '<leader>g', group = 'git', icon = '' },
        { '<leader>l', group = 'lsp', icon = '' },
        { '<leader>n', group = 'neotree', icon = '' },
        { '<leader>o', group = 'outline/aerial', icon = '' },
        { '<leader>s', group = 'search', icon = '' },
        { '<leader>t', group = 'tab', icon = '' },
        { '<leader>w', group = 'window/workspace', icon = '' },
        { '<leader>x', group = 'close', icon = '' },
        { 'g', group = 'goto', icon = '' },
        { '[', group = 'prev', icon = '' },
        { ']', group = 'next', icon = '' },
      },
    },
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
