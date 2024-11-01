local wz = require("wezterm")

local config = wz.config_builder()

GetOS = function()
    if
        wz.target_triple:find("linux") ~= nil
        or wz.target_triple:find("apple") ~= nil
    then
        return "unix"
    elseif wz.target_triple:find("windows") then
        return "windows"
    end
end

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

require("fonts").setup(config)
require("colors").setup(config)

return config
