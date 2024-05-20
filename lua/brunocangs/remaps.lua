vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>dd", ":bd!<CR>")

-- Navigate quickfix
vim.keymap.set('n', '<leader>qn', ':cnext<CR>')
vim.keymap.set('n', '<leader>qp', ':cprev<CR>')
vim.keymap.set('n', '<leader>qq', function() vim.cmd.cexpr("[]") vim.cmd.cclose()  end)

-- Tabs
vim.keymap.set("n", "<leader>wc", ":tabnew<CR>")
vim.keymap.set("n", "<leader>wo", ":tabonly<CR>")
vim.keymap.set("n", "<leader>wd", ":tabnew %<CR>")
vim.keymap.set("n", "<leader>wq", ":tabclose<CR>")
vim.keymap.set("n", "<leader>wn", ":tabnext<CR>")
vim.keymap.set("n", "<leader>wp", ":tabprev<CR>")

-- Splits movement
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")

-- Terminal

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>t", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
