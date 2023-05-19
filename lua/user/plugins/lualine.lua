-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-mocha",
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"buffers",
			},
		},
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
	},
})
