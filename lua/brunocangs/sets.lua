vim.o.nu = true
vim.opt.relativenumber = true


vim.opt.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.inccommand = "split"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")


vim.opt.updatetime = 50

vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true

vim.o.cmdheight = 0

vim.opt.diffopt = "iblank,vertical,internal"
