local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = vimgrep_arguments,
                mappings = {
                    i = {
                        ["<esc>"] = actions.close
                    }
                },
                layout_strategy = 'flex',
                layout_config = {
                    flex = {
                        width = '100%',
                        height = '100%',
                    }
                }
            },
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        })

        local builtin = require("telescope.builtin")

        -- Search git files
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})

        -- Search all project files
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

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
        vim.keymap.set("n", "<leader>pb", builtin.buffers, {})

        -- Git status
        vim.keymap.set("n", "<leader>gg", builtin.git_status, {})

        -- Git commits
        vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})

        -- Git branches
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})

        -- Git buffer commits
        vim.keymap.set("n", "<leader>bc", builtin.git_bcommits, {})

        -- List telescope builtin pickers
        vim.keymap.set("n", "<leader>bi", builtin.builtin, {})
    end
}
