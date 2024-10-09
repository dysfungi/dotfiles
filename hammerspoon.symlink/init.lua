-- http://www.hammerspoon.org/docs/index.html

-- wezterm configuration
-- https://github.com/kovidgoyal/kitty/issues/45#issuecomment-1097554906
hs.hotkey.bind({"ctrl"}, "space", function()
    local wezterm = hs.application.get("wezterm")
    local focusedSpaceId = hs.spaces.focusedSpace()

    if wezterm then

        if not wezterm:mainWindow() then
            wezterm:selectMenuItem("New OS Window", true)

        elseif wezterm:isFrontmost() then
            wezterm:hide()

        else
            wezterm:activate()
            wezterm:mainWindow():raise()
            wezterm:mainWindow():moveToUnit('0.0,0.0,1.0,1.0')
        end

    else
        hs.application.launchOrFocus("wezterm")
        wezterm = hs.application.get("wezterm")
    end
end)
