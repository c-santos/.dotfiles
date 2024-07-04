return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        local lsp_lines = require("lsp_lines")
        lsp_lines.setup({})
        vim.keymap.set("n", "<leader>l", lsp_lines.toggle)
    end
}
