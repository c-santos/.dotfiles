return {
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require('oil').setup({
                default_file_explorer = false,
                columns = {
                    "mtime",
                    "size",
                    "icon",
                },
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide"
                },
                win_options = {
                    signcolumn = "yes",
                    list = true
                },
                view_options = {
                    show_hidden = true
                }
            })
            vim.keymap.set('n', '<leader>e', ':Oil<CR>', { desc = 'Open parent directory.' })
        end
    }
}
