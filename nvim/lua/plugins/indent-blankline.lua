-- adds indent line ( line showing scope )
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require('ibl').setup({
            indent = {
                char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
            },
        })
    end,
    opts = {},
}
