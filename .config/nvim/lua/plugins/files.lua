return{
	    -- Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- File tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config= function()
			require('nvim-tree').setup{view = {relativenumber = true
		}
	}
        end,
   },

   -- nnn
   -- {
	  --  "mcchrish/nnn.vim",
   -- },

}
