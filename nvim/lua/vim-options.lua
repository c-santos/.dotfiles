vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set linebreak")
vim.cmd("set clipboard=unnamedplus")

vim.opt.nu = true
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro' -- netrw line num
vim.g.have_nerd_font = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.o.guicursor=""

vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"
vim.opt.mouse = 'a'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
