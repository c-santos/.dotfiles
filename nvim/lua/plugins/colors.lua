return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "transparent",
                    floats = "transparent"
                }
            })
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        config = function ()
            require("vscode").setup({
                italic_comments = false,
            })
        end
    },
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
                flavour = "macchiato"
            })
        end
    }
}
