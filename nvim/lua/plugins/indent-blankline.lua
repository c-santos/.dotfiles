-- adds indent line ( line showing scope )
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local highlight = {
            "RainbowOrange",
            "RainbowBlue",
            "RainbowCyan",
            "RainbowGreen",
            "RainbowViolet",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        end)
        require('ibl').setup({
            indent = {
                char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
            },
            whitespace = {
                remove_blankline_trail = false,
            },
            scope = {
                enabled = true,
                highlight = highlight
            }
        })
    end,
    opts = {},
}
