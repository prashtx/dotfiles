local osx = require 'osx'
local commands = require 'commands'
local chrome = require 'chrome'
local uuid = require 'uuid'
local private = require 'private'

local custom_commands = commands.setup(commands.extend(commands.builtins, {
  {
    uuid = uuid(),
    text = 'Lock screen',
    image = hs.image.imageFromName('NSLockLockedTemplate'),
    fn = osx.screensaver
  },
  {
    uuid = uuid(),
    text = 'Tabs',
    subText = 'Search Chrome tabs',
    fn = chrome.tab_chooser
  },
  {
    uuid = uuid(),
    text = 'Zesty',
    subText = 'What\'s for lunch',
    fn = function ()
      chrome.open_tab(private.zesty_url)
    end
  },
  {
    uuid = uuid(),
    text = 'Pulls',
    subText = 'Pull requests',
    fn = function ()
      chrome.open_tab('https://github.com/pulls')
    end
  }
}))

hs.hotkey.bind({"shift", "cmd"}, "space", function()
  local chooser = hs.chooser.new(function (choice)
    custom_commands.handler(choice)
    chooser:delete()
  end)
  chooser:choices(custom_commands.choices)
  chooser:searchSubText(true)
  chooser:show()
end)


-- Watch for config file changes
function reloadConfig(files) hs.reload() end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

hs.alert('Hammerspoon Reloaded', 0.5)
