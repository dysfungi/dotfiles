-- wezterm configuration
-- https://github.com/kovidgoyal/kitty/issues/45#issuecomment-1097554906
hs.hotkey.bind({"ctrl"}, "space", function()

  -- Get current space 
  local currentSpace = hs.spaces.focusedSpace()

  -- Get wezterm app
  local app = hs.application.get("wezterm")

  -- If app already open:
  if app then

      -- If no main window, then open a new window
      if not app:mainWindow() then
          app:selectMenuItem("New OS Window", true)

      -- If app is already in front, then hide it
      elseif app:isFrontmost() then
          app:hide()

      -- If there is a main window somewhere, bring it to current space and to front
      else
          -- First move the main window to the current space
          hs.spaces.moveWindowToSpace(app:mainWindow(), currentSpace)
          -- Activate the app
          app:activate()
          -- Raise the main window and position correctly
          app:mainWindow():raise()
          app:mainWindow():moveToUnit('0.0,0.0,1.0,1.0')
      end

  -- If app not open, open it
  else
      hs.application.launchOrFocus("wezterm")
      app = hs.application.get("wezterm")
  end

  -- hs.spaces.gotoSpace(currentSpace)

end)
