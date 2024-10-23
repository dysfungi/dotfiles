-- http://www.hammerspoon.org/docs/index.html

-- wezterm configuration
-- https://github.com/kovidgoyal/kitty/issues/45#issuecomment-1097554906
hs.hotkey.bind({"ctrl"}, "space", function()
    print()
    print("Handling hotkey to show/hide Wezterm")
    local wezterm = hs.application.get("wezterm")

    if wezterm then
        print("Wezterm application PID =", wezterm:pid())
        local primaryScreen = hs.screen.primaryScreen()
        print("Primary screen ID =", primaryScreen:id())
        local primaryActiveSpaceId = hs.spaces.activeSpaceOnScreen(primaryScreen)
        print("Primary active space ID =", primaryActiveSpaceId)
        local weztermWindow = wezterm:mainWindow()
        local weztermWindowId = weztermWindow:id()
        print("Wezterm window ID =", weztermWindowId)
        if not weztermWindow then
            print("Opening new Wezterm window because there are none")
            wezterm:selectMenuItem("New OS Window", true)
        elseif wezterm:isFrontmost() then
            print("Hiding Wezterm because it is already frontmost")
            wezterm:hide()
        elseif wezterm:isHidden() then
            print("Unhiding Wezterm and moving to primary space")
            if not wezterm:unhide() then
                print("ERROR: Could not unhide Wezterm")
            end
            hs.spaces.moveWindowToSpace(weztermWindowId, primaryActiveSpaceId)
            print("Activating and focusing on Wezterm")
            wezterm:activate()
            weztermWindow:raise()
            weztermWindow:moveToUnit('0.0,0.0,1.0,1.0')
        else
            -- TODO: https://github.com/Hammerspoon/hammerspoon/issues/3698
            print("Moving unhidden Wezterm to primary space")
            print("Wezterm main window " .. weztermWindowId .. " exists on spaces =", hs.spaces.windowSpaces(weztermWindowId))
            if not hs.spaces.moveWindowToSpace(weztermWindowId, primaryActiveSpaceId, true) then
                print("ERROR: Could not move window " .. weztermWindowId .. " to space " .. primaryActiveSpaceId)
            end
            print("Moved window " .. weztermWindowId .. " to space " .. primaryActiveSpaceId)
            wezterm:activate()
        end
    else
        print("Opening Wezterm because it is not already")
        hs.application.launchOrFocus("wezterm")
        wezterm = hs.application.get("wezterm")
    end
    print("Handled hotkey to show Wezterm")
    print()
end)
