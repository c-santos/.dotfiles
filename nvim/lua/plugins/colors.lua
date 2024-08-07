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
        config = function ()
            require("kanagawa").setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                statementStyle = { bold = true },
                terminalColors = true,
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppucin",
        priority = 1000,
        config = function ()
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
    },
    -- {
    --     'olivercederborg/poimandres.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('poimandres').setup {
    --             -- leave this setup function empty for default config
    --             -- or refer to the configuration section
    --             -- for configuration options
    --             bold_vert_split = false
    --         }
    --     end,
    -- },
    {
        'Mofiqul/vscode.nvim',
        config = function ()
            require('vscode').setup({
                transparent = false
            })
        end
    }

}
