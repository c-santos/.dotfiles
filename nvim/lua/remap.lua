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

-- open current file + line in GitHub remote
remap("n", "<leader>go", function()
	local function trim(s)
		return s:match("^%s*(.-)%s*$")
	end

	local root = trim(vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"))
	if root == "" or vim.v.shell_error ~= 0 then
		vim.notify("Not inside a git repository", vim.log.levels.WARN)
		return
	end

	local branch = trim(vim.fn.system("git branch --show-current 2>/dev/null"))
	if branch == "" then
		vim.notify("Could not determine current git branch", vim.log.levels.WARN)
		return
	end

	local remote = trim(vim.fn.system("git remote get-url origin 2>/dev/null"))
	if remote == "" or vim.v.shell_error ~= 0 then
		vim.notify("No 'origin' remote found", vim.log.levels.WARN)
		return
	end

	-- Normalise SSH → HTTPS: git@github.com:user/repo.git → https://github.com/user/repo
	remote = remote:gsub("%.git$", "")
	remote = remote:gsub("^git@([^:]+):", "https://%1/")

	local filepath = vim.fn.expand("%:p")
	local rel = filepath:sub(#root + 2) -- strip root + trailing slash
	local line = vim.fn.line(".")

	local url = string.format("%s/blob/%s/%s#L%d", remote, branch, rel, line)

	local opener = vim.fn.has("mac") == 1 and "open" or "explorer.exe"
	vim.fn.jobstart({ opener, url }, { detach = true })
	vim.notify("Opened: " .. url)
end, { desc = "Open file in GitHub" })
