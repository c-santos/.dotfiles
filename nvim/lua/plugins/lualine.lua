return {
    "nvim-lualine/lualine.nvim",
    dependecies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup({
            options = { theme = "auto" },
        })
    end
}
