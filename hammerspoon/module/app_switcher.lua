local M = {}

local modeName = "appSelector"
function M.init(config)
	spoon.ModalMgr:new(modeName)

	local cmodal = spoon.ModalMgr.modal_list[modeName]
	cmodal:bind("", "escape", "Deactivate App Selector", function()
		spoon.ModalMgr:deactivate({ modeName })
	end)
	cmodal:bind("", "tab", "Toggle Cheatsheet", function()
		spoon.ModalMgr:toggleCheatsheet()
	end)

	for _, v in ipairs(config.apps) do
		cmodal:bind("", v.key, v.name, function()
			hs.application.launchOrFocusByBundleID(v.id)
			spoon.ModalMgr:deactivate({ modeName })
		end)
		if v.direct then
			hs.hotkey.bind(config.hyper, v.key, function()
				hs.application.launchOrFocusByBundleID(v.id)
			end)
		end
	end

	-- Then we register some keybindings with modal supervisor
	spoon.ModalMgr.supervisor:bind(config.hyper, config.modes.apps, "Enter App Selector", function()
		spoon.ModalMgr:deactivateAll()
		-- Show the keybindings cheatsheet once appM is activated
		spoon.ModalMgr:activate({ modeName }, "#FFBD2E", true)
	end)
end

return M
