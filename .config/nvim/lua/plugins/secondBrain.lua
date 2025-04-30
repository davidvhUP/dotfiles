return{
	        -- gen.nvim model
        { "David-Kunz/gen.nvim",
        opts = {
            model = "qwen2.5-coder:1.5b-instruct", -- The default model to use.
            host = "localhost", -- The host running the Ollama service.
            port = "11434", -- The port on which the Ollama service is listening.
            quit_map = "q", -- set keymap for close the response window
            retry_map = "<c-r>", -- set keymap to re-send the current prompt
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- Function to initialize Ollama
            command = function(options)
                local body = {model = options.model, stream = true}
                return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            display_mode = "float", -- The display mode. Can be "float" or "split".
            show_prompt = true, -- Shows the prompt submitted to Ollama.
            show_model = true, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            debug = false -- Prints errors and the command which is run.
            }
        },

		        -- obsidian.nvim
        {
            "epwalsh/obsidian.nvim",
            version = "*",  -- recommended, use latest release instead of latest commit
            lazy = false,
            ft = "markdown",
            dependencies = {
                -- Required.
                "nvim-lua/plenary.nvim",
                -- Optional.
                "nvim-telescope/telescope.nvim"
                -- see below for full list of optional dependencies 👇
            },
            opts = {
                workspaces = {
                    {
                        name = "Obsidian Vault",
                        path = "/mnt/d/My Drive (Personal)/Obsidian Vault/",
                    },
                },
                daily_notes = {
                    -- Optional, if you keep daily notes in a separate directory.
                    folder = "Periodic notes/Daily Notes",
                    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                    template = "/mnt/d/My Drive (Personal)/Obsidian Vault/Templates/Daily Review.md"
                },
                completion = {
                    -- Set to false to disable completion.
                    nvim_cmp = true,
                    -- Trigger completion at 2 chars.
                    min_chars = 2,
                },
                templates = {
                    subdir = "/mnt/d/My Drive (Personal)/Obsidian Vault/Templates",
                },
            },
        },



}
