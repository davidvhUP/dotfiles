return{
	    -- Colour Scheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
	config = function()
    require("catppuccin").setup()

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
	  end,
	},
	

	-- visualise buffers as tabs
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	-- Visualise Marks
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup()
		end
	},

		-- treesitter
	{ "nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "markdown", "markdown_inline", "lua", "python", "r", "rnoweb", "html" },
				highlight = {
					enable = true,
				},
			})
		end,
	},

	-- Noice (command popup)
	{
		"folke/noice.nvim",
		routes = {
			{
				view = "split",
				filter = { event = "msg_showmode" },
			},
			opts = { skip = true }
		},
		notify = {
			enabled = true,
			view = "notify",
		},
		messages = {
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				-- cmdline = { pattern = "^:", icon = "", lang = "vim" },
				-- search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				-- search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				-- filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				-- help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				-- input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
		},
	},
		event = "VeryLazy",
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		opts = {
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			"nvim-lualine/lualine.nvim",
	},
},

		-- dashboard
		{
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
				require('dashboard').setup {
					-- Hyper config
					theme = 'hyper',
					config = {
						week_header = {
							enable = true,
						},
						shortcut = {
							{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
							{
								icon = ' ',
								icon_hl = '@variable',
								desc = 'Files',
								group = 'Label',
								action = 'Telescope find_files hidden=true no_ignore=true',
								key = 'f',
							},
							{
								desc = ' Obsidian Daily Note',
								group = 'DiagnosticHint',
								action = 'ObsidianToday',
								key = 'a',
							},
							{
								desc = ' AI Chat',
								group = 'Number',
								action = 'Gen Chat',
								key = 'd',
							},
						},
						shortcut_type = { 'number'
					},
					hide = {
						tabline= true, -- hide statusline from dashboard
					},
				},
				-- Doom config
				-- theme = 'doom',
				-- config = {
				-- 	header = {'Welcome!'}, --your header
				-- 	center = {
				-- 		{
				-- 			icon = ' ',
				-- 			icon_hl = 'Title',
				-- 			desc = 'Find File           ',
				-- 			desc_hl = 'String',
				-- 			key = 'b',
				-- 			keymap = 'SPC f f',
				-- 			key_hl = 'Number',
				-- 			key_format = ' %s', -- remove default surrounding `[]`
				-- 			action = 'lua print(2)'
				-- 		},
				-- 		{
				-- 			icon = ' ',
				-- 			desc = 'Find Dotfiles',
				-- 			key = 'f',
				-- 			keymap = 'SPC f d',
				-- 			key_format = ' %s', -- remove default surrounding `[]`
				-- 			action = 'lua print(3)'
				-- 		},
				-- 	},
				-- 	footer = {'This is a footer'}  --your footer
				-- }
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	{ 'sbdchd/neoformat',
	config = function()
		-- require('neoformat').setup {
			-- config
			--  }
		end,
	},

	-- tab lines
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
	config = function()
		require("ibl").setup({
			exclude = { 
				filetypes = {"dashboard"},
			},
		})
	end,
	},

	-- image preview
	{
		'adelarsq/image_preview.nvim',
		event = 'VeryLazy',
		config = function()
			require("image_preview").setup()
		end
	},



}
