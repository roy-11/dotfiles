local app_map = {}
local mash = { "cmd", "ctrl" }

-- local function registerAppLauncer(modifier, app)
--   table.insert(app_map, string.lower(modifier) .. " - " .. app)
--   hs.hotkey.bind(mash, modifier, function()
--     hs.application.launchOrFocus(app)
--   end)
-- end
-- registerAppLauncer("S", "Slack")
-- registerAppLauncer("i", "kitty")

local function hotkeyWindow(modifier, appName)
  table.insert(app_map, string.lower(modifier) .. " - " .. appName)
  hs.hotkey.bind(mash, modifier, function()
    local currentSpace = hs.spaces.focusedSpace()
    local app = hs.application.get(appName)

    -- アプリがすでに開いている場合:
    if app then
      -- メインウィンドウがなければ新しいウィンドウを開く
      if not app:mainWindow() then
        app:selectMenuItem("New OS Window", true)
      -- アプリが前面にある場合は非表示にする
      elseif app:isFrontmost() then
        if appName == "Arc" then
          -- Arc の場合は hideが機能しないためCmd + H を送信
          hs.eventtap.keyStroke({ "cmd" }, "H")
        else
          app:hide()
        end
      -- メインウィンドウがどこかにある場合、それを現在のスペースに移動し、前面に出す
      else
        -- メインウィンドウを現在のスペースに移動
        hs.spaces.moveWindowToSpace(app:mainWindow(), currentSpace)
        -- アプリをアクティブにする
        app:activate()

        -- メインウィンドウを最前面に持ってきて適切に配置
        -- ディスプレイを検出して条件分岐
        local mainScreen = hs.screen.mainScreen():name()
        if string.find(mainScreen, "Retina") then
          app:mainWindow():raise()
          app:mainWindow():moveToUnit("0.0,0.03,1.0,1.0") -- MacBook本体のディスプレイの場合
        else
          app:mainWindow():raise()
          app:mainWindow():moveToUnit("0.0,0.055,1.0,1.0") -- 外部ディスプレイの場合
        end
      end

    -- アプリが開いていない場合、それを開く
    else
      hs.application.launchOrFocus(appName)
      app = hs.application.get(appName)
    end

    -- hs.spaces.gotoSpace(currentSpace)
  end)
end

-- hotkeyWindow("S", "Slack")
-- hotkeyWindow("A", "Arc")
hotkeyWindow("O", "Obsidian")
hotkeyWindow("I", "ChatGPT")
