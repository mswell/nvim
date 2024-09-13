local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
    require("onedark").setup({
      transparent = true,
      style = "darker",
    })
  vim.cmd.colorscheme "onedark"
end

return M
