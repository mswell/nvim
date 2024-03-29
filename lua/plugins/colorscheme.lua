return {
  {
    -- "sainnhe/sonokai",
    -- priority = 1000,
    -- config = function()
    --   vim.g.sonokai_transparent_background = "1"
    --   vim.g.sonokai_enable_italic = "1"
    --   vim.g.sonokai_style = "atlantis"
    -- end,
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
