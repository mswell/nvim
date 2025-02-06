return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = true,
        italic_comments = true,
        borderless_telescope = false,
        theme = {
          saturation = 0.6,
        },
      }
      vim.cmd [[colorscheme cyberdream]]
    end,
  },
}
