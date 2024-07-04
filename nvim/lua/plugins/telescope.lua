return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close
                    }
                },
                layout_strategy = 'horizontal',
                layout_config = {
                    preview_width = 0.6,
                    horizontal = {
                        size = {
                            width = "100%",
                            height = "100%"
                        }
                    }
                }
            }
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
    end
}
