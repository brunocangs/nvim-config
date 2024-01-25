return {
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gh', ':0Gclog<CR>')
			vim.keymap.set('n', '<leader>ge', function()
				vim.cmd("Gedit")
				vim.cmd("ccl")
			end)
			vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>')

			vim.keymap.set('n', '<leader>gH', ':Gclog --graph --oneline --all<CR>')
		end
	},
	'tpope/vim-sleuth'
}
