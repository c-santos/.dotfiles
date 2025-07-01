-- formatter plugin
return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = false, timeout_ms = 500, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "autopep8" }
			},
		})
	end,
}
