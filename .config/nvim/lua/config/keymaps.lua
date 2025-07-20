-- space bar leader key
vim.g.mapleader = ' '

-- navigate directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- (ok) move file in current buffer to 'fleeting notes'
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /mnt/d/Google\\ Drive/Obsidian\\ vault/Fleeting\\ notes<cr>bd:<cr>")

-- (odd) delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p' <cr>:bd<cr>")

-- python comment block
vim.keymap.set('n', '<leader>cb', 'i"""<esc>o"""<esc>')

-- fenced code block
vim.keymap.set("n", "<leader>fc", "i```<esc>o```<esc>")

-- Telescope
vim.keymap.set("n", "<leader>pf", ":Telescope find_files hidden=true<cr>") vim.keymap.set("n", "<C-g>", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>ps", ":Telescope live_grep<cr>")

-- tree
vim.keymap.set("n", "<leader>ft", ":NvimTreeFindFileToggle<cr>")

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- debugger
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<cr>")
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<cr>")
vim.keymap.set("n", "<leader>dc", ":DapContinue<cr>")
vim.keymap.set("n", "<leader>da", ":DapContinue<cr>")

-- co-pilot
-- vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gc', ':Gen Chat<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gen Ask<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gr', ':Gen Review_Code<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>ge', ':Gen Enhance_Code<CR>')
vim.keymap.set("n", "<leader>gm", ":lua require('gen').select_model()<CR>")

-- obsidian
vim.keymap.set({ 'n' }, '<leader>ot', ':ObsidianToday<CR>')
vim.keymap.set({ 'n' }, '<leader>onc', ':ObsidianTemplate Coding notes.md<CR>')
vim.keymap.set({ 'n' }, '<leader>on', ':ObsidianTemplate Default.md<CR>')
vim.keymap.set({ 'n' }, '<leader>oq', ':ObsidianQuickSwitch<CR>')

-- Gitsigns
vim.keymap.set("n", "<leader>gs", ":Gitsigns preview_hunk_inline<CR>", {})

-- Dismiss Noice Messages
vim.keymap.set("n", "<leader>nd", ":Noice dismiss<CR>", {desc = "Dismiss Noice Message"})

-- Dashboard
vim.keymap.set("n", "<leader>d", ":Dashboard<CR>")
vim.keymap.set("n", "<leader>cd", ":bd%<CR>:Dashboard<CR>")

-- list 
vim.keymap.set("n", "<leader>ls", ":lua vim.diagnostic.setloclist()<cr>")

-- trouble
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set("n", "<leader>cs", ":Trouble symbols toggle focus=false<CR>")
vim.keymap.set("n", "<leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>")
vim.keymap.set("n", "<leader>xL", ":Trouble loclist toggle<CR>")
vim.keymap.set("n", "<leader>xQ", ":Trouble qflist toggle<CR>")

-- repl
-- vim.keymap.set("n", "<leader>ri", ":ReplIpython<CR>")

-- pandoc shortcuts
vim.keymap.set("n", "<leader>pdm", ":!pandoc -s -o ~/Documents/%:r.pdf -f markdown -t pdf -V indent=true -V geometry:margin=1in %<CR>")

