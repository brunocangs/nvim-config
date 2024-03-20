return {
	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		config = function ()
			require('lualine').setup({
			options = {
				icons_enabled = false,
				-- theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
			sections = {
				lualine_b = { "diagnostics" },
				lualine_c = { {
					'filename',
					path = 4
				} },
				lualine_x = { "filetype" },
				lualine_y = {},
			}
		})
		end
	},

	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
	}
}
