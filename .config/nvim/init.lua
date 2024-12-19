require("config.keymaps")
require("config.lazy")
require("config.options")

-- plugins
require("plugins.appearance")
require("plugins.coding")
require("plugins.debug")
require("plugins.files")
require("plugins.lsp")
require("plugins.R")
require("plugins.secondBrain")
require("plugins.writing")

-- remember folds
local folds_augroup = vim.api.nvim_create_augroup("Folds", { clear=true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = folds_augroup,
    command = "mkview | filetype detect | set foldmethod=manual"
})

vim.api.nvim_create_autocmd("QuitPre", {
    group = folds_augroup,
    command = "mkview | filetype detect | set foldmethod=manual"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = folds_augroup,
    command = "silent! loadview | filetype detect | set foldmethod=manual | normal! zM"
})

