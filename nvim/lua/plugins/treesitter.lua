return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = {"BufReadPre", "BufNewFile"},
        config = function ()
            require 'nvim-treesitter.install'.prefer_git = false
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {
                    "lua",
                    "javascript",
                    "typescript",
                    "python",
                    "html",
                    "sql",
                    "yaml",
                    "css",
                    "tsx",
                    "typescript",
                    "json",
                    "dockerfile",
                    "git_config",
                    "gitignore",
                    "git_rebase",
                    "gitcommit",
                    "markdown",
                    "vimdoc",
                    "bash",
                    "http"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                endwise = {
                    enable = true
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function ()
            require("treesitter-context").setup({
                enable = true,
                line_numbers = true,
                multiline_threshold = 2,
                max_lines = 2,
                trim_scope = 'inner'
            })
            vim.cmd("hi TreesitterContextLineNumberBottom guisp=Grey")
            vim.cmd("hi TreesitterContextBottom guisp=Grey")
        end
    }
}
