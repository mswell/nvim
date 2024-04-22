local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

local M = {}

local TERM = os.getenv("TERM")

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
  harpoon_ui.toggle_quick_menu()
end, { desc = "Toggle Harpoon Menu" })

-- Add current file to harpoon
nnoremap("<leader>ha", function()
  harpoon_mark.add_file()
end, { desc = "Harpoon: mark file" })

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
  harpoon_mark.rm_file()
end, { desc = "Remove current file from harpoon" })

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
  harpoon_mark.clear_all()
end, { desc = "Remove all files from harpoon" })

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
  harpoon_ui.nav_file(1)
end, { desc = "Harpoon file 1" })

nnoremap("<leader>2", function()
  harpoon_ui.nav_file(2)
end, { desc = "Harpoon file 2" })

nnoremap("<leader>3", function()
  harpoon_ui.nav_file(3)
end, { desc = "Harpoon file 3" })

nnoremap("<leader>4", function()
  harpoon_ui.nav_file(4)
end, { desc = "Harpoon file 4" })

nnoremap("<leader>5", function()
  harpoon_ui.nav_file(5)
end, { desc = "Harpoon file 5" })
