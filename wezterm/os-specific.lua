local wz = require("wezterm")

---@param config table
local setup = function(config)
    local current_os = GetOS()
    if current_os == "unix" then
        -- Fonts
        config.font = wz.font_with_fallback({
            { family = "BlexMono Nerd Font Mono", weight = 400 },
            { family = "CodeNewRoman Nerd Font Mono", weight = 400 },
            { family = "JetBrainsMono Nerd Font", weight = 400 },
            { family = "BigBlueTerm437 Nerd Font Mono", weight = 400 },
            { family = "FiraCode Nerd Font", weight = 400 },
            { family = "Hack Nerd Font", weight = 400 },
            -- Unused
            { family = "UbuntuSansMono Nerd Font Mono", weight = 400 },
            { family = "MesloLGSDZ Nerd Font", weight = 400 },
            { family = "GeistMono Nerd Font", weight = 400 },
            { family = "CommitMono Nerd Font", weight = 400 },
        })
    elseif current_os == "windows" then
        return wz.font_with_fallback({
            { family = "CodeNewRoman Nerd Font Mono", weight = 400 },
            { family = "FiraCode Nerd Font", weight = 400 },
            { family = "JetBrainsMono Nerd Font", weight = 400 },
            { family = "Hack Nerd Font", weight = 400 },
            -- Unused
            { family = "UbuntuSansMono Nerd Font Mono", weight = 400 },
            { family = "MesloLGSDZ Nerd Font", weight = 400 },
            { family = "GeistMono Nerd Font", weight = 400 },
            { family = "CommitMono Nerd Font", weight = 400 },
        })
    end
end

return setup
