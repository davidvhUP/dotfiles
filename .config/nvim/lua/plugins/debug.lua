return{
	{ "mfussenegger/nvim-dap", 
		config = function() end, -- This is an empty function to avoid errors
},
	{ "HiPhish/debugpy.nvim" }, -- python debugger
	{ "nvim-neotest/nvim-nio" }, -- nvim-nio
	{ "rcarriga/nvim-dap-ui", -- Debug UI
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio",  "folke/neodev.nvim"},
		config = function()
			require("dapui").setup({
				mappings = {
					-- Use a table to apply multiple mappings
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
			})
			require("neodev").setup{ library = { plugins = { "nvim-dap-ui" }, types = true }, }
		end,
	},

	-- debug icons
	{ "ChristianChiarulli/neovim-codicons" },
		config = function()
			require("neovim-codicons").setup{
			}
		end,
		
	-- Virtual text
	{ "theHamsta/nvim-dap-virtual-text" },
	
	-- Python DAP
	{ "mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui"
	},
		--'/home/davidvh/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
		config = function()
			require('dap-python').setup('/opt/miniconda3/bin/python')
			local dap = require ('dap')
				-- dap.adapters.python = {
				-- 	type = 'executable',
				-- 	command = '/usr/bin/python',
				-- 	args = {'-m', 'debugpy.adapter'}
				-- }
				dap.configurations.python = {
					{
						type = 'python',
						request = 'launch',
						name = "Launch file",
						program = "${file}";
						pythonPath = '/opt/miniconda3/bin/python',
						cwd = "/"

					},
					{
						type = 'python',
						request = 'launch',
						name = "Launch file with arguments",
						program = "${file}",
						args = function()
							local args_string = vim.fn.input('Enter arguments (separated by spaces): ')
							return vim.split(args_string, " +")
						end,
						pythonPath ='/opt/miniconda3/bin/python'
				},
			}
		end,
	},
}
