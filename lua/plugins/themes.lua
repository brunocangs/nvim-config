return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				-- variant = "moon"
			})
		end
	}
}
