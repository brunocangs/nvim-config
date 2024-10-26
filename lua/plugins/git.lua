return {
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set("n","<leader>gs", vim.cmd.Git)
			vim.keymap.set('n', '<leader>gh', function()
				vim.cmd(vim.api.nvim_win_get_cursor(0)[1] .. ',' .. 'Gclog')
			end)
			vim.keymap.set('n', '<leader>ge', function()
				vim.cmd("Gedit")
				vim.cmd("ccl")
			end)
			vim.keymap.set('n', '<leader>gd', function()
				vim.cmd('Gdiffsplit!')
			end)

			vim.keymap.set('n', '<leader>mc', function()
				vim.cmd('Git mergetool')
			end)
			vim.keymap.set('n', '<leader>gH', function() vim.cmd('Gclog --graph --oneline --all') end)
			vim.keymap.set('n', '<leader>gu', function() vim.cmd('Git fetch --all') end, { desc = 'Fetch all remotes', noremap = true, silent = true })
		end
	}
	-- ,
	-- 'tpope/vim-sleuth'
}
