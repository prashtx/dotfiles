local chrome = {}

local util = require 'util'

function chrome.get_tabs()
  local success, data, desc = hs.osascript.javascript([[
    var chrome = Application('Google Chrome');
    var tabs = [];
    chrome.windows().forEach(function (win) {
      win.tabs().forEach(function (tab) {
        tabs.push({
          id: tab.id(),
          win: win.id(),
          text: tab.title(),
          subText: tab.url()
        });
      });
    });
    tabs
  ]])
  if not success then
    return {}
  end
  return data
end

function chrome.activate_tab(win, id)
  local success, data, desc = hs.osascript.applescript([[
    tell application "Google Chrome"
      set w to window id ]] .. win .. [[

      tell w
        set i to 0
        repeat with t in tabs
          set i to i + 1
          if id of t is equal to ]] .. id .. [[ then
            activate w
            set active tab index of w to i
          end if
        end repeat
      end tell
    end tell
  ]])
end

function chrome.activate_tab_title(str)
  print(hs.inspect.inspect(str))
  local success, data, desc = hs.osascript.applescript([[
    tell application "Google Chrome"
      set i to 0
      repeat with w in windows
        set i to i + 1
        set j to 0
        repeat with t in tabs of w
          set j to j + 1
          if title of t contains "]] .. str .. [[" then
            tell application "System Events"
              tell process "Google Chrome" to perform action "AXRaise" of window i
            end tell
            tell w to set active tab index to j
            activate w
            return
          end if
        end repeat
      end repeat
    end tell
  ]])
end


function chrome.tab_chooser()
  local chooser = hs.chooser.new(function (choice)
    chrome.activate_tab(choice.win, choice.id)
    chooser:delete()
  end)
  chooser:choices(chrome.get_tabs())
  chooser:searchSubText(true)
  chooser:show()
end

function chrome.open_win(url)
  local success, data, desc = hs.osascript.applescript([[
    tell application "Google Chrome"
      set win to make new window
      tell win
        set t to item 1 of tabs
        tell t to set URL to "]] .. url .. [["
      end tell
      activate
    end tell
  ]])
end

function chrome.open_tab(url)
  local success, data, desc = hs.osascript.applescript([[
    tell application "Google Chrome"
      set win to item 1 of windows
      tell win to make new tab with properties {URL:"]] .. url .. [["}
      tell win to set visible to true
      activate
    end tell
  ]])
end

function chrome.show()
  util.show_application('Google Chrome')
end

return chrome
