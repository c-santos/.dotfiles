local language_servers = { "lua_ls", "tsserver", "jsonls", "cssls" }

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
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
        "ray-x/lsp_signature.nvim"
    },
    config = function()
        -- Setup plugins without custom config
        require("fidget").setup({})
        require("mason").setup({})
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Define on_attach function for LSP.
        -- This function runs when an LSP attaches to the buffer.
        local on_attach = function(_, bufnr)
            -- Remaps
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("K", vim.lsp.buf.hover, "Hover documentation.")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
            nmap("<leader>f", vim.lsp.buf.format, "[F]ormat")
            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gtd", vim.lsp.buf.type_definition, "[G]oto [T]ype [D]efinition")
            nmap("<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "[G]oto [W]orkspace [Symbols]")
            nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[G]oto [D]ocument [Symbols]")


            -- Signature help
            local signature_help = {
                bind = true,
                handler_opts = {
                    border = "rounded",
                },
                hint_prefix = {
                    above = "↙ ", -- when the hint is on the line above the current line
                    current = "← ", -- when the hint is on the same line
                    below = "↖ " -- when the hint is on the line below the current line
                }
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

        -- Setup Mason to handle LSPs.
        require("mason-lspconfig").setup({
            ensure_installed = language_servers,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        handlers = {
                            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                        }
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        handlers = {
                            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                        },
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            },

        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(cmp_select),
                ['<C-f>'] = cmp.mapping.scroll_docs(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        -- Diagnostics
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
            float = {
                focusable = false,
                style = "minimal",
                signs = true,
                underline = true,
                border = "rounded",
                source = "always",
                header = "",
            }
        })
    end
}
