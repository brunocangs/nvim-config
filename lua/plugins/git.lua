return {
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gh', ':0Gclog<CR>')
		end
	},
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth'
}
