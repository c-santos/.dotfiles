return {
    'MeanderingProgrammer/render-markdown.nvim',
    config = function ()
        require('render-markdown').setup()
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
}
