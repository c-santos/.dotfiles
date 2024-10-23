return {
	"theprimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>rr",
			function()
				require("refactoring").select_refactor({
					show_success_messages = true,
				})
			end,
			mode = { "n", "v", "x" },
		},
	},
}
