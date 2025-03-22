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

require("lazy").setup("plugins")

local randomize_colors = function()
    local choices = {
        "rose-pine-moon",
        "vscode",
        "catppuccin",
        "kanagawa-dragon",
        "nordic",
        "duskfox",
        "gruvbox-material",
    }
    local chosen = choices[math.random(#choices)]
    print("Loaded theme: ", chosen)
    Color(chosen)
end

local auto_light_mode = function(light_theme, night_theme)
    local t = os.date("*t")
    if t.wday == 2 or t.wday == 4 then
        if t.hour < 16 then
            Color(light_theme)
        end
    else
        Color(night_theme)
    end
end

-- auto_light_mode('dayfox', 'carbonfox')

Color('Tokyonight-night')
-- Color('rose-pine-moon')
-- Color('vscode')
-- Color('catppuccin')
-- Color('kanagawa-dragon')
-- Color('nordic')
-- Color("carbonfox")
-- Color("dayfox")
-- Color("gruvbox-material")
