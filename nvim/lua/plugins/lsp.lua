local language_servers = {
    "lua_ls",
    "ts_ls",
    "jsonls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "tailwindcss",
    "gopls"
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "ray-x/lsp_signature.nvim",
    },
    config = function()
        -- Setup plugins without custom config
        require("fidget").setup({})
        require("mason").setup({})

        -- This function runs when an LSP attaches to the buffer.
        local on_attach = function(_, bufnr)
            local function set(mode, lhs, rhs, desc)
                if desc then
                    desc = "LSP: " .. desc
                end
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            set("n", "K", vim.lsp.buf.hover, "Hover documentation.")
            set("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
            set("n", "<leader>f", vim.lsp.buf.format, "[F]ormat")
            set("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            set("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            set("n", "gb", "<c-t>", "[G]o [b]ack with tagstack")
            set("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            set("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            set("n", "gtd", vim.lsp.buf.type_definition, "[G]oto [T]ype [D]efinition")
            set("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "[W]orkspace [S]ymbols")

            -- Signature help
            local signature_help = {
                bind = true,
                handler_opts = {
                    border = "rounded",
                },
                hint_prefix = {
                    above = "↙ ",
                    current = "← ",
                    below = "↖ ",
                },
            }
            require("lsp_signature").on_attach(signature_help, bufnr)
        end

        -- Combine LSP capabilities and native capabilities.
        local cmp = require("cmp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        -- special Lua LSP config to detect vim globals
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = {
                ["textDocument/hover"] = vim.lsp.with(
                    vim.lsp.handlers.hover,
                    { border = "rounded" }
                ),
            },
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = {
                            "bit",
                            "vim",
                            "it",
                            "describe",
                            "before_each",
                            "after_each",
                        },
                    },
                },
            },
        })

        -- mason-lspconfig connects mason and nvim-lspconfig
        require("mason-lspconfig").setup({
            ensure_installed = language_servers,
            handlers = {
                function(server_name)
                    vim.lsp.config(server_name, {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        -- handlers = {
                        --     ["textDocument/hover"] = vim.lsp.with(
                        --         vim.lsp.handlers.hover,
                        --         { border = "rounded" }
                        --     ),
                        -- },
                    })
                end,
            },
        })

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }, {
                { name = "buffer" },
            }),
        })

        -- Completion for buffer search
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Completion for cmdline search
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        -- Diagnostics
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<S-d>", vim.diagnostic.open_float)
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                focusable = false,
                style = "minimal",
                signs = true,
                underline = true,
                border = "rounded",
                source = "always",
                header = "",
            },
        })
    end,
}
