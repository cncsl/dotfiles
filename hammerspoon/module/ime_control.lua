local M = {}

function M.init(config)
	M.ime_auto_switcher = hs.application.watcher
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
end

return M
