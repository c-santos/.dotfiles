vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    desc = 'Show line number in telescope preview',
    callback = function(args)
        vim.wo.number = true
    end,
})
