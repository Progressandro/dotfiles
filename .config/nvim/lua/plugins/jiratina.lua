return {
	{
		dir = "~/repositories/jiratina.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("jiratina")
		end,
	},
}
