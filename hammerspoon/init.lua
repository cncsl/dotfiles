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

----------------------------------------------------------------------------------------------------
-- appM modal environment
spoon.ModalMgr:new("appM")
local cmodal = spoon.ModalMgr.modal_list["appM"]
cmodal:bind("", "escape", "Deactivate appM", function()
	spoon.ModalMgr:deactivate({ "appM" })
end)
cmodal:bind("", "tab", "Toggle Cheatsheet", function()
	spoon.ModalMgr:toggleCheatsheet()
end)
for _, v in ipairs(config.apps) do
	cmodal:bind("", v.key, v.name, function()
		hs.application.launchOrFocusByBundleID(v.id)
		spoon.ModalMgr:deactivate({ "appM" })
	end)
	if v.direct then
		hs.hotkey.bind(config.hyper, v.key, function()
			hs.application.launchOrFocusByBundleID(v.id)
		end)
	end
end

-- Then we register some keybindings with modal supervisor
spoon.ModalMgr.supervisor:bind(config.hyper, config.modes.apps, "Enter AppM Environment", function()
	spoon.ModalMgr:deactivateAll()
	-- Show the keybindings cheatsheet once appM is activated
	spoon.ModalMgr:activate({ "appM" }, "#FFBD2E", true)
end)

----------------------------------------------------------------------------------------------------
-- resizeM modal environment
if spoon.WinWin then
	spoon.ModalMgr:new("resizeM")
	local cmodal = spoon.ModalMgr.modal_list["resizeM"]
	cmodal:bind("", "escape", "Deactivate resizeM", function()
		spoon.ModalMgr:deactivate({ "resizeM" })
	end)
	cmodal:bind("", "tab", "Toggle Cheatsheet", function()
		spoon.ModalMgr:toggleCheatsheet()
	end)
	-- step move
	for _, item in ipairs(config.windowMgr_keys.stepMove) do
		cmodal:bind(
			"",
			item.key,
			item.label,
			function()
				spoon.WinWin:stash()
				spoon.WinWin:stepMove(item.direction)
			end,
			nil,
			function()
				spoon.WinWin:stash()
				spoon.WinWin:stepMove(item.direction)
			end
		)
	end
	-- move and resize
	for _, item in ipairs(config.windowMgr_keys.moveAndResize) do
		cmodal:bind("", item.key, item.label, function()
			spoon.WinWin:stash()
			spoon.WinWin:moveAndResize(item.mode)
		end)
	end
	-- step resize
	for _, item in ipairs(config.windowMgr_keys.stepResize) do
		cmodal:bind(
			"shift",
			item.key,
			item.label,
			function()
				spoon.WinWin:stash()
				spoon.WinWin:stepResize(item.direction)
			end,
			nil,
			function()
				spoon.WinWin:stash()
				spoon.WinWin:stepResize(item.direction)
			end
		)
	end
	-- move to screen
	for _, item in ipairs(config.windowMgr_keys.moveToScreen) do
		cmodal:bind("", item.key, item.label, function()
			spoon.WinWin:stash()
			spoon.WinWin:moveToScreen(item.direction)
		end)
	end
	-- undo
	cmodal:bind("", config.windowMgr_keys.undo.key, config.windowMgr_keys.undo.label, function()
		spoon.WinWin:undo()
	end)
	-- center cursor
	cmodal:bind("", config.windowMgr_keys.centerCursor.key, config.windowMgr_keys.centerCursor.label, function()
		spoon.WinWin:centerCursor()
	end)

	-- Register resizeM with modal supervisor
	spoon.ModalMgr.supervisor:bind(config.hyper, config.modes.window_mgr, "Enter resizeM Environment", function()
		-- Deactivate some modal environments or not before activating a new one
		spoon.ModalMgr:deactivateAll()
		-- Show an status indicator so we know we're in some modal environment now
		spoon.ModalMgr:activate({ "resizeM" }, "#B22222")
	end)
end

if spoon.KSheet then
	spoon.ModalMgr:new("cheatsheetM")
	local cmodal = spoon.ModalMgr.modal_list["cheatsheetM"]
	cmodal:bind("", "escape", "Deactivate cheatsheetM", function()
		spoon.KSheet:hide()
		spoon.ModalMgr:deactivate({ "cheatsheetM" })
	end)

	-- Register cheatsheetM with modal supervisor
	spoon.ModalMgr.supervisor:bind(config.hyper, config.modes.cheatsheet, "Enter cheatsheetM Environment", function()
		spoon.KSheet:show()
		spoon.ModalMgr:deactivateAll()
		spoon.ModalMgr:activate({ "cheatsheetM" })
	end)
end

ime_auto_switcher = hs.application.watcher
	.new(function(_, eventType, appObj)
		if eventType ~= hs.application.watcher.activated then
			return
		end
		local new_ime = config.ime_list.DEFAULT
		for _, app in ipairs(config.apps) do
			if app.id == appObj:bundleID() then
				new_ime = app.ime or config.ime_list.DEFAULT
				break
			end
		end
		hs.keycodes.currentSourceID(new_ime)
	end)
	:start()

----------------------------------------------------------------------------------------------------
-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()
