local config = require("config")

hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- for test/debug
-- hs.hotkey.bind(config.hyper, "r", "Reload Configuration", function()
-- 	hs.reload()
-- 	hs.notify.new({ title = "Hammerspoon", informativeText = "Configuration Reloaded", withdrawAfter = 3 }):send()
-- end)

-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
hs.loadSpoon("ModalMgr")
for _, v in ipairs(config.spoons) do
	hs.loadSpoon(v)
end

-- require("module/system_control").init(config)
require("module/app_switcher").init(config)
require("module/ime_control").init(config)
require("module/window_mgr").init(config)
require("module/cheatsheet").init(config)

----------------------------------------------------------------------------------------------------
-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()
