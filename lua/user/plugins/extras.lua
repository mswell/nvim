local extras = {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
  },
}

return extras
