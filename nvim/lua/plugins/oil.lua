return {
    'stevearc/oil.nvim',
    config = function()
        require('oil').setup({
            vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { silent = true }),
            default_file_explorer = true,
            columns = {
                "icon", "size"
            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false
            }
        })
    end
}
