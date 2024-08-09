return {
    'tpope/vim-fugitive',
    config = function()
        -- vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gv", ":Gvdiffsplit<CR>")
        vim.keymap.set("n", "<leader>gh", ":Gdiffsplit<CR>")
    end
}
