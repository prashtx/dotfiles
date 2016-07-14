local commands = {}

local util = require 'util'
local uuid = require 'uuid'

local function show_app(x)
  util.show_application(x.data)
end

local function get_app_switch_commands()
  local apps = hs.application.runningApplications()
  local list = hs.fnutils.map(apps, function (app)
    if app == nil then return nil end
    local id = app:bundleID()
    if id == nil then return nil end
    -- Just keep apps that appear in the dock
    if app:kind() ~= 1 then return nil end
    local title = ''
    if app:mainWindow() then title = app:mainWindow():title() or '' end
    return {
      uuid = uuid(),
      text = app:name(),
      subText = title,
      image = hs.image.imageFromAppBundle(app:bundleID()),
      data = app:name(),
      fn = show_app
    }
  end)
  local list2 = hs.fnutils.filter(list, function (x)
    return x ~= nil
  end)
  return list2
end

local function get_builtins()
  return get_app_switch_commands()
end

local function make_id(x) return (x.text or '') .. (x.subText or '') end

function commands.extend(base, actions)
  local new_choices = hs.fnutils.map(actions, function (action)
    return {
      uuid = action.uuid,
      text = action.text,
      subText = action.subText,
      image = action.image,
      data = action.data
    }
  end)

  local new_handlers = hs.fnutils.map(actions, function (action)
    return {
      uuid = action.uuid,
      fn = action.fn
    }
  end)

  local handlers = {}
  for key, value in pairs(base.handlers) do
    handlers[key] = value
  end

  hs.fnutils.each(actions, function (action)
    handlers[action.uuid] = action.fn
  end)

  local choices = hs.fnutils.concat(base.choices, new_choices)

  return {
    choices = choices,
    handlers = handlers
  }
end

commands.builtins = commands.extend({
  choices = {},
  handlers = {}
}, get_app_switch_commands())

function commands.setup(config)
  print(hs.inspect.inspect(config.handlers))
  return {
    choices = config.choices,
    handler = function (choice)
      if choice then
        config.handlers[choice.uuid](choice)
      end
    end
  }
end

return commands
