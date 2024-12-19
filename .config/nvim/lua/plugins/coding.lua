return{
	-- autoclose
	{ 'm4xshen/autoclose.nvim',
	config = function()
		require("autoclose").setup({
			keys = {
				["("] = { escape = false, close = true, pair = "()" },
				["["] = { escape = false, close = true, pair = "[]" },
				["{"] = { escape = false, close = true, pair = "{}" },
				['"'] = { escape = true, close = true, pair = '""' },
				["'"] = { escape = true, close = true, pair = "''" },
				["`"] = { escape = true, close = true, pair = "``" },
			},
			options = {
				disabled_filetypes = { "text" },
				disable_when_touch = false,
				touch_regex = "[%w(%[{]",
				pair_spaces = false,
				auto_indent = true,
				disable_command_mode = false,},
			})
		end
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
	{ "GCBallesteros/NotebookNavigator.nvim",
	keys = {
		{ "]h", function() require("notebook-navigator").move_cell "d" end },
		{ "[h", function() require("notebook-navigator").move_cell "u" end },
		-- { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
		-- { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
	},
	dependencies = {
		"echasnovski/mini.comment",
		"hkupty/iron.nvim", -- repl provider
		-- "akinsho/toggleterm.nvim", -- alternative repl provider
		-- "benlubas/molten-nvim", -- alternative repl provider
		"anuvyklack/hydra.nvim",
	},
	event = "VeryLazy",
	config = function()
		local nn = require "notebook-navigator"
		nn.setup({ activate_hydra_keys = "<leader>h" })
	end, 
	},

	{ "Vigemus/iron.nvim",
	config = function()
		-- require('iron').setup()
	end,
	},

}
