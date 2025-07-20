vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = true -- relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.autochdir = true -- Automatically change dir to file dir
vim.opt.textwidth = 100 -- Set text width for wrapping
vim.opt.wrap = true
-- vim.opt.hlsearch = false -- don't higlight results from previous search
vim.opt.ignorecase = true -- search ignores case
vim.opt.undofile = true -- persistent undo (even when closing and opening files)
 
--colorscheme
-- vim.cmd("colorscheme catppucin-macchiato")

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}
