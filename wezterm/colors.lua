local M = {}

-- Color schemes
M.setup = function(config)
    -- Custom themes
    -- config.colors = require("nordic")
    -- config.colors = require("kanagawa-dragon")

    -- Wezterm themes
    config.color_scheme = "carbonfox"
    -- config.color_scheme = "Nord (Gogh)"
    -- config.color_scheme = "Catppuccin Mocha"
end

return M
