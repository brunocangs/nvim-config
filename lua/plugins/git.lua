return {
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gh', function()
				print(vim.api.nvim_win_get_cursor(0)[1] .. ',' .. 'Gclog')
				vim.cmd(vim.api.nvim_win_get_cursor(0)[1] .. ',' .. 'Gclog')
			end)
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
