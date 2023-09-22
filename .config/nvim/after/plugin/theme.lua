require("catppuccin").setup({
	transparent_background = true,
})

color = colors or "catppuccin"
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "normal", { bg = "none" })
vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })
