return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            current_line_blame = true,
            on_attach = function(bufnr)
                local map = function (mode, key, cmd, opts)
                    opts = { buffer = bufnr }
                    vim.keymap.set(mode, key, cmd, opts)
                end

                map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
                map("n", "<leader>gu", ":Gitsigns reset_hunk<CR>")

                map("v", "<leader>sh", function()
                    gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
                end)
                map("n", "<leader>sh", ":Gitsigns stage_hunk<CR>")

                map("n", "<leader>su", ":Gitsigns undo_stage_hunk<CR>")
                map("v", "<leader>su", function()
                    gitsigns.undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
                end)

                map("n", "]c", ":Gitsigns next_hunk<CR>")
                map("n", "[c", ":Gitsigns prev_hunk<CR>")
            end
        })
    end
}
