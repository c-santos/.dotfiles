return {
    'stevearc/oil.nvim',
    config = function ()
        require('oil').setup({
            vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { silent = true }),
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            }
        })
    end
}
