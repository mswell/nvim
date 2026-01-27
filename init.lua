require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  require 'plugins.themes.gruvbox',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.lualine',
  require 'plugins.bufferline',
  require 'plugins.neo-tree',
  require 'plugins.alpha',
  
  require 'plugins.comment',
  require 'plugins.debug',
  require 'plugins.gitsigns',
  require 'plugins.database',
  require 'plugins.misc',
  require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
  require 'plugins.aerial',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.copilot',
  require 'plugins.opencode',
  require 'plugins.snacks',
  require 'plugins.noice',


}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Handle session loading and Neo-tree opening after plugins are loaded
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Se abrimos um diretório, abrir Neo-tree em vez de carregar sessão
    if vim.g.neotree_opened_directory then
      vim.schedule(function()
        local arg = vim.fn.argv(0)
        -- Fechar o buffer vazio do diretório
        vim.cmd 'silent! bdelete'
        -- Abrir Neo-tree no diretório
        vim.cmd('Neotree show dir=' .. vim.fn.fnameescape(vim.fn.fnamemodify(arg, ':p')))
      end)
      return
    end

    -- Caso contrário, carregar sessão se existir
    local session_file = '.session.vim'
    if file_exists(session_file) then
      vim.cmd('source ' .. session_file)
    end
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
