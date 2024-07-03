return {
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults'
                -- ysiw) -> surround word with )
                -- ysaw -> surround whole paragraph with
                -- ds) -> delete surrounding )'s
            })
        end
    },
}
