require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
})

local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not status then
	print("Colorcheme not found!")
	return
end
