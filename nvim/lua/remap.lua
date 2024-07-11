local noremap = function (mode, keys, cmd, opts)
   vim.keymap.set(mode, keys, cmd, opts)
end

-- map leader
vim.g.mapleader = " "

-- netrw
noremap("n", "<leader>pv", ":Ex<CR>", { silent = true })

-- press esc after highlight no highlights 
noremap('n', '<Esc>', ':noh<CR>', { silent = true })

-- move highlighted with cursor
noremap("v", "J", ":m '>+1<CR>gv=gv")
noremap("v", "K", ":m '<-2<CR>gv=gv")

-- center cursor when nexting search
noremap("n", "n", "nzzzv")
noremap("n", "N", "Nzzzv")

-- center cursor when moving page
noremap("n", "<C-u>", "<C-u>zz")
noremap("n", "<C-d>", "<C-d>zz")

-- when pasting over a highlighted text, retains the yanked thing
vim.keymap.set("x", "<leader>p", [["_dP]])

-- substitute all instances of word on cursor
noremap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- exit insert mode with 'jk'
noremap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- tab movement
noremap('n', '<C-J>', '<C-W>w')
noremap('n', '<C-K>', '<C-W>w')
noremap('n', '<C-t>', ':vsplit<CR>')

-- tmux pane
noremap('n', '<c-k>', ':wincmd k<CR>')
noremap('n', '<c-j>', ':wincmd j<CR>')
noremap('n', '<c-h>', ':wincmd h<CR>')
noremap('n', '<c-l>', ':wincmd l<CR>')

