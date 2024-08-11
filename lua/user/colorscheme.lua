local M = {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
    require("cyberdream").setup({
      transparent = true,
    })
  vim.cmd.colorscheme "cyberdream"
end

return M
