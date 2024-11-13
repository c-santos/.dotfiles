local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = vimgrep_arguments,
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        },
                    },
                    layout_strategy = "flex",
                    layout_config = {
                        horizontal = {
                            width = 0.9,
                            height = 0.9,
                            prompt_position = "bottom",
                        },
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            prompt_position = "bottom",
                        },
                    },
                },
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        find_command = {
                            "rg",
                            "--files",
                            "--hidden",
                            "--glob",
                            "!**/.git/*",
                        },
                    },
                },
            })

            local builtin = require("telescope.builtin")

            -- Search all project files
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

            -- Search all Git-tracked files
            vim.keymap.set("n", "<leader>pp", builtin.git_files, {})

            -- Search string
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

            -- Search string under cursor
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end, {})

            -- Search string under cursor big
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, {})

            -- Search buffers
            vim.keymap.set(
                "n",
                "<leader>pb",
                builtin.buffers,
                { desc = "[P]roject [b]uffers" }
            )

            -- Git commits
            vim.keymap.set(
                "n",
                "<leader>gc",
                builtin.git_commits,
                { desc = "[G]it [c]ommits" }
            )

            -- Git branches
            vim.keymap.set(
                "n",
                "<leader>gb",
                builtin.git_branches,
                { desc = "[G]it [b]ranches" }
            )

            -- Git commits of current buffer
            vim.keymap.set(
                "n",
                "<leader>bc",
                builtin.git_bcommits,
                { desc = "[B]uffer [c]ommits" }
            )

            -- List telescope builtin pickers
            vim.keymap.set(
                "n",
                "<leader>bi",
                builtin.builtin,
                { desc = "[B]uilt[i]n" }
            )

            -- Find in current buffer
            vim.keymap.set("n", "<C-f>", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                        prompt_title = "Buffer search",
                    })
                )
            end, { desc = "[B]uffer [s]earch" })

            -- Search in open files
            vim.keymap.set("n", "<leader>os", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Search in open files",
                })
            end, { desc = "[O]pen files [s]earch" })

            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action()
            end)
        end,
    },
    {
        -- Makes vim.ui.select use telescope
        -- Allows core neovim stuff to use telescope
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
