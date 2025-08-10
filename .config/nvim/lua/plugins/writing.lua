return{
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	},

    {
        "brianhuster/autosave.nvim",
        event="InsertEnter",
        opts = {} -- Configuration here
    },

	{ 'nvim-telescope/telescope-symbols.nvim',

},

	-- in your lazy.nvim configuration
	{
		'L3MON4D3/LuaSnip',
		-- follow the instructions on their GitHub page for setup
		dependencies = {
			-- optional, but highly recommended for autocompletion
			'rafamadriz/friendly-snippets',
		},
		config = function()
			-- This is important to load the snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()
			-- You might also have this if you have custom Lua snippets:
			-- require("luasnip.loaders.from_lua").lazy_load()
		end
	}


}
