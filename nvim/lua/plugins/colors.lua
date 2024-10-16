return {
    -- {
    --     "folke/tokyonight.nvim",
    --     config = function()
    --         require("tokyonight").setup({
    --             transparent = true,
    --             terminal_colors = true,
    --             styles = {
    --                 comments = { italic = false },
    --                 keywords = { italic = false },
    --                 sidebars = "transparent",
    --                 floats = "transparent"
    --             }
    --         })
    --     end,
    -- },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                -- statementStyle = { bold = true },
                transparent = false,
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppucin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "auto",
                transparent_background = true,
                term_colors = true
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            require('rose-pine').setup({
                variant = "moon",
                styles = {
                    transparency = false,
                    italic = true,
                    bold = true
                }
            })
        end
    },
    {
        'Mofiqul/vscode.nvim',
        config = function()
            require('vscode').setup({
                transparent = false
            })
        end
    }
}
