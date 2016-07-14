local util = {}

function util.show_application(_app)
    local app = hs.appfinder.appFromName(_app)
    if not app then
        return
    end
    local mainwin = app:mainWindow()
    if mainwin and mainwin ~= hs.window.focusedWindow() then
        mainwin:application():activate(true)
        mainwin:application():unhide()
        mainwin:focus()
    end
end

function util.show_window(title)
  local win = hs.window.get(title):unminimize()
end

return util
