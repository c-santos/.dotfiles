-- general vim settings
vim.opt.termguicolors = true

vim.opt.updatetime = 100

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undofile = true
vim.opt.wildignore:append({ "*/node_modules/*" })

-- buffer ui settings
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.g.have_nerd_font = true
vim.opt.guicursor = "" -- block cursor on insert mode
vim.opt.colorcolumn = "80"

-- buffer behavior settings

-- tabs and indents
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.inccommand = "split"

vim.opt.mouse = "a"

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro" -- netrw line num

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
