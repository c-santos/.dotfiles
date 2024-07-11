return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup({
            current_line_blame = true
        })
        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
        vim.keymap.set("n", "<leader>gu", ":Gitsigns reset_hunk<CR>")
        vim.keymap.set("n", "<leader>sh", ":Gitsigns stage_hunk<CR>")
        vim.keymap.set("n", "<leader>su", ":Gitsigns undo_stage_hunk<CR>")
        vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>")
    end
}
