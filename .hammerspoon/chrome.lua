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
  local success, data, desc = hs.osascript.javascript([[
    var chrome = Application('Google Chrome');
    var window = chrome.windows.byId(]] .. win .. [[)
    var hit = window.tabs().reduce(function (memo, tab, i) {
      if (memo !== -1) { return memo; }
      if (tab.id() === ]] .. id .. [[) { return i; }
      return memo;
    }, -1);
    if (hit > -1) {
      window.visible = true;
      window.activeTabIndex = hit;
    }
  ]])
  util.show_application('Google Chrome')
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
