local remap = function(mode, keys, cmd, opts)
	vim.keymap.set(mode, keys, cmd, opts)
end

-- map leader
vim.g.mapleader = " "

-- vanquish cut char to the x register
remap("n", "x", '"_x')

-- open default file explorer
remap("n", "<leader>pv", ":Ex<CR>", { silent = true })

-- press esc after highlight no highlights
remap("n", "<Esc>", ":noh<CR>", { silent = true })

-- move highlighted selection with cursor
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

-- center cursor when nexting search
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")

-- center cursor when moving page
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

-- when pasting over a highlighted text, retains the yanked thing
remap("x", "<leader>p", [["_dP]])

-- substitute all instances in buffer of word that the cursor is on
remap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- exit insert mode with 'jk'
remap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- create split
remap("n", "<C-t>", ":vsplit<CR>")

-- move between splits
remap("n", "<C-J>", "<C-W>w")
remap("n", "<C-K>", "<C-W>w")

-- tmux pane movement
remap("n", "<c-k>", ":wincmd k<CR>")
remap("n", "<c-j>", ":wincmd j<CR>")
remap("n", "<c-h>", ":wincmd h<CR>")
remap("n", "<c-l>", ":wincmd l<CR>")
