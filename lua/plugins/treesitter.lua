-- Highlight, edit, and navigate code
-- Updated for nvim-treesitter 1.x (main branch)
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    -- Parsers to install
    local parsers = {
      'lua',
      'python',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'tsx',
      'css',
      'html',
    }

    -- Install parsers
    for _, parser in ipairs(parsers) do
      ts.install(parser)
    end

    -- Register additional file extensions
    vim.filetype.add { extension = { tf = 'terraform' } }
    vim.filetype.add { extension = { tfvars = 'terraform' } }
    vim.filetype.add { extension = { pipeline = 'groovy' } }
    vim.filetype.add { extension = { multibranch = 'groovy' } }
    vim.treesitter.language.register('groovy', 'Jenkinsfile')

    -- Start treesitter for all filetypes
    local patterns = {}
    for _, parser in ipairs(parsers) do
      local ok, parser_patterns = pcall(vim.treesitter.language.get_filetypes, parser)
      if ok then
        for _, pp in pairs(parser_patterns) do
          table.insert(patterns, pp)
        end
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = patterns,
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- Folding with treesitter
    vim.api.nvim_create_autocmd('FileType', {
      pattern = patterns,
      callback = function()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
      end,
    })

    -- Incremental selection keymaps
    vim.keymap.set('n', '<c-space>', function()
      require('nvim-treesitter.incremental_selection').init_selection()
    end, { desc = 'Init Selection' })
    vim.keymap.set('x', '<c-space>', function()
      require('nvim-treesitter.incremental_selection').node_incremental()
    end, { desc = 'Node Incremental' })
    vim.keymap.set('x', '<c-s>', function()
      require('nvim-treesitter.incremental_selection').scope_incremental()
    end, { desc = 'Scope Incremental' })
    vim.keymap.set('x', '<M-space>', function()
      require('nvim-treesitter.incremental_selection').node_decremental()
    end, { desc = 'Node Decremental' })
  end,
}
