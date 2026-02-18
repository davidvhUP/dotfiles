return{
	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },  -- only if you use nvim-cmp
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				-- Core behavior similar to your autoclose
				disable_filetype     = { "TelescopePrompt", "vim", "text" },  -- like your disabled_filetypes
				disable_in_macro     = false,
				disable_in_visualblock = false,
				disable_in_replace_mode = true,   -- sane default, avoids weirdness in :s///
				ignored_next_char   = "[%w]",     -- ← key fix: no autopair if next char is letter/digit → solves 'don't / it's
				enable_moveright     = true,
				enable_afterquote    = true,      -- adds closing quote after typing one
				enable_check_bracket_line = true, -- avoids adding closing pair if one already exists on line
				check_ts             = true,      -- enable Treesitter check (recommended, needs nvim-treesitter)
				ts_config = {
					lua = { 'string' },             -- don't autopair inside lua strings, add others as needed
					-- javascript = { 'template_string' }, etc.
				},
				map_cr               = true,      -- <CR> expands pairs nicely (e.g. { → {\n\t|\n})
				map_bs               = true,      -- backspace deletes pair if empty
				auto_indent          = true,      -- like your auto_indent = true
				-- fast_wrap            = {},     -- enable later if you want <M-e> style wrapping
			})

			-- If using nvim-cmp (very common)
			if pcall(require, "cmp") then
				local cmp_autopairs = require('nvim-autopairs.completion.cmp')
				local cmp = require("cmp")
				cmp.event:on(
					'confirm_done',
					cmp_autopairs.on_confirm_done()
				)
			end
		end,
	},

	--  code commenter
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	
	-- Git
	-- { "tpope/vim-fugitive" -- fugitive (git handler)
	-- },
	--
	{
		"lewis6991/gitsigns.nvim", -- Gitsigns
		config = function()
			require("gitsigns").setup()

		end,
	},

	{
		-- Lazygit
		'kdheepak/lazygit.nvim',
		cmd = {
			'LazyGit',
			'LazyGitConfig',
			'LazyGitCurrentFile',
			'LazyGitFilter',
			'LazyGitFilterCurrentFile',
		},
		-- optional for floating window border decoration
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
		},
	},

	-- Web tools (html?)
	-- {
	-- 	"ray-x/web-tools.nvim",
	-- 	config = function()
	-- 		require('web-tools').setup()
	-- 	end,
	-- },
	
	-- .ipynb reader
	{ "GCBallesteros/jupytext.nvim", -- Open .ipynb files
	config = function()
		require('jupytext').setup()
	end,
	},
	
	-- {
	-- 	"pappasam/nvim-repl",
	-- 	config = function()
	-- 		require('repl').setup()
	-- 	end,
	-- },

	{ "Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")
		iron.setup({
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = {"bash"}
					},
					python = {
						command = {"ipython", "--no-autoindent"},  -- or { "ipython", "--no-autoindent" }
						format = require("iron.fts.common").bracketed_paste,
						block_dividers = { "# %%", "#%%" },
					}
				},
				-- set the file type of the newly created repl to ft
				-- bufnr is the buffer id of the REPL and ft is the filetype of the 
				-- language being used for the REPL. 
				repl_filetype = function(bufnr, ft)
					return ft
					-- or return a string name such as the following
					-- return "iron"
				end,
				-- How the repl window will be displayed
				-- See below for more information
				-- repl_open_cmd = view.split.vertical.("%40"),

				-- repl_open_cmd can also be an array-style table so that multiple 
				-- repl_open_commands can be given.
				-- When repl_open_cmd is given as a table, the first command given will
				-- be the command that `IronRepl` initially toggles.
				-- Moreover, when repl_open_cmd is a table, each key will automatically
				-- be available as a keymap (see `keymaps` below) with the names 
				-- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
				-- For example,
				-- 
				repl_open_cmd = {
					  view.split.vertical.rightbelow("%30"), -- cmd_1: open a repl to the right
					  -- view.split.right("%25")  -- cmd_2: open a repl below
					}

				},
				-- Iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					toggle_repl = "<space>rr", -- toggles the repl open and closed.
					-- If repl_open_command is a table as above, then the following keymaps are
					-- available
					-- toggle_repl_with_cmd_1 = "<space>rv",
					-- toggle_repl_with_cmd_2 = "<space>rh",
					restart_repl = "<space>r<shift>r", -- calls `IronRestart` to restart the repl
					send_motion = "<space>sc",
					visual_send = "<space>sc",
					send_file = "<space>sf",
					send_line = "<space>sl",
					send_paragraph = "<space>sp",
					send_until_cursor = "<space>su",
					send_mark = "<space>sm",
					send_code_block = "<space>sb",
					send_code_block_and_move = "<space>sn",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>sq",
					-- clear = "<space>cl",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})
			vim.keymap.set("n", "<leader>si", function()
				vim.ui.input({ prompt = "IronSend to IPython: " }, function(input)
					if input and input ~= "" then
						vim.cmd("IronSend " .. input)
					end
				end)
			end, { desc = "IronSend: Send command to REPL" })
		end,
	},

	{ "christoomey/vim-tmux-navigator", 
	lazy = false,
	},

	-- aider
	{
		"joshuavial/aider.nvim",
		opts = {
			-- your configuration comes here
			-- if you don't want to use the default settings
			auto_manage_context = true, -- automatically manage buffer context
			default_bindings = true,    -- use default <leader>A keybindings
			debug = false,              -- enable debug logging
		},
	},

	-- code window
	{ "gorbit99/codewindow.nvim", 
		config = function()
			local codewindow = require('codewindow')
			codewindow.setup()
			codewindow.apply_default_keybinds()
		end,

	},

}
