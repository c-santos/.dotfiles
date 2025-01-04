Color = function(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    -- background
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalDark", { bg = "none" })
end

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
                    floats = "transparent",
                },
            })
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                commentStyle = { bold = false, italic = false },
                statementStyle = { bold = false, italic = false },
                functionStyle = { bold = false, italic = false },
                keywordStyle = { bold = false, italic = false },
                typeStyle = { bold = false, italic = false },
                terminalColors = true,
                dimInactive = false,
                transparent = false,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            },
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        -- Save an hlgroup with dark background and dimmed foreground
                        -- so that you can use it where your still want darker windows.
                        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        NormalDark = {
                            fg = theme.ui.fg_dim,
                            bg = theme.ui.bg_m3,
                        },

                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal = {
                            bg = theme.ui.bg_m3,
                            fg = theme.ui.fg_dim,
                        },
                        MasonNormal = {
                            bg = theme.ui.bg_m3,
                            fg = theme.ui.fg_dim,
                        },

                        -- Borderless block-like telescope ui
                        -- TelescopeTitle = { fg = theme.ui.special, bold = true },
                        -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end,
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppucin",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                term_colors = true,
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                terminal_colors = true,
                styles = {
                    transparency = true,
                    italic = false,
                    bold = true,
                },
            })
        end,
    },
    {
        "AlexvZyl/nordic.nvim",
        config = function()
            require("nordic").setup({
                bold_keywords = true,
                -- Enable italic comments.
                italic_comments = false,
                -- Enable editor background transparency.
                transparent = {
                    -- Enable transparent background.
                    bg = false,
                    -- Enable transparent background for floating windows.
                    float = false,
                },
                -- Enable brighter float border.
                bright_border = false,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = false,
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = false,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = "dark",
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.8,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = "classic",
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = "flat",
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                },
            })
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                -- Alternatively set style in setup
                -- style = 'light'

                -- Enable transparent background
                transparent = true,

                -- Enable italic comment
                italic_comments = true,

                -- Underline `@markup.link.*` variants
                underline_links = true,

                -- Disable nvim-tree background color
                disable_nvimtree_bg = true,

                -- -- Override colors (see ./lua/vscode/colors.lua)
                -- color_overrides = {
                --     vscLineNumber = "#FFFFFF",
                -- },
                --
                -- -- Override highlight groups (see ./lua/vscode/theme.lua)
                -- group_overrides = {
                --     -- this supports the same val table as vim.api.nvim_set_hl
                --     -- use colors from this colorscheme by requiring vscode.colors!
                --     Cursor = {
                --         fg = c.vscDarkBlue,
                --         bg = c.vscLightGreen,
                --         bold = true,
                --     },
                -- },
            })
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                },
            })
        end,
    },
    {
        "cpwrs/americano.nvim",
        config = function()
            require("americano").setup({
                terminal = true,
            })
        end,
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = "hard"
        end
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup({
                termcolors = true,
                style = "darker"
            })
        end
    },
}
