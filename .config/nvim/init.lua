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

-- Lua snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets/" })
-- Yes, we're just executing a bunch of Vimscript, but this is the officially
-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

