local wz = require("wezterm")

local config = wz.config_builder()

GetOS = function()
    if wz.target_triple:find("apple") then
        return "macos"
    elseif wz.target_triple:find("windows") then
        return "windows"
    elseif wz.target_triple:find("linux") then
        return "linux"
    end
end

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

require("fonts").setup(config)
require("colors").setup(config)

return config
