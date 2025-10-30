-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', { desc = 'Clear Search Highlights' })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { desc = 'Save File' })

-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', { desc = 'Save Without Formatting' })

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { desc = 'Quit' })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down and Center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up and Center' })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next Search Result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev Search Result' })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { desc = 'New Buffer' })

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment Number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement Number' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split Vertically' })
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split Horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal Window Size' })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { desc = 'Close Split' })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Go to Right Window' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Prev Tab' })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle Line Wrap' })

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit Insert Mode' })
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Exit Insert Mode' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent Left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent Right' })

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste Without Yank' })

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', { desc = 'Replace Word Under Cursor' })

-- Explicitly yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank Line to System Clipboard' })

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end, { desc = 'Toggle Diagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic List' })

-- Session management
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false, desc = 'Save Session' })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false, desc = 'Load Session' })
