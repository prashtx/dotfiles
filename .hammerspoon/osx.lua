local osx = {}

function osx.screensaver()
  os.execute('open /System/Library/Frameworks/ScreenSaver.framework/Versions/Current/Resources/ScreenSaverEngine.app')
end

return osx
