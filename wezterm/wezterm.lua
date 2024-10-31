local wz = require("wezterm")

local config = {}

if wz.config_builder() then
	config = wz.config_builder()
end

-- General
config.automatically_reload_config = true

-- UI
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.line_height = 1.0
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false

-- Color schemes

config.colors = require("nordic")
-- config.colors = require("kanagawa-dragon")

-- config.color_scheme = "Nord (Gogh)"
-- config.color_scheme = "Catppuccin Mocha"

require("os-specific").setup(config)

return config
