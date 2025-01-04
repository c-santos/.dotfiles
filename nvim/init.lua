require("vim-options")
require("remap")
require("autocmd")
require("snips")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

local randomize_colors = function ()
  local choices = {
    "rose-pine-moon",
    "vscode",
    "catppuccin",
    "kanagawa-dragon",
    "kanagawa-dragon",
    "nordic",
    "duskfox",
    "americano",
    "gruvbox-material",
    "onedark"
  }
  local chosen = choices[math.random(#choices)]
  print("Loaded theme: ", chosen)
  Color(chosen)
end

randomize_colors()

-- Color('Tokyonight-night')
-- Color('rose-pine-moon')
-- Color('vscode')
-- Color('catppuccin')
-- Color('kanagawa-dragon')
-- Color('nordic')
-- Color('duskfox')
-- Color('americano')
-- Color("gruvbox-material")
-- Color("onedark")
