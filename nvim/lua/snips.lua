local remap = function(mode, keys, cmd, opts)
	vim.keymap.set(mode, keys, cmd, opts)
end


-- JS/TS

-- Quick log
remap("n", "<leader>ll", "oconsole.log(Thing, '');<Esc>3b")
