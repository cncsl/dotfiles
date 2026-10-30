local M = {}

function M.init(config)
	M.ime_auto_switcher = hs.application.watcher
		.new(function(_, eventType, appObj)
			if eventType ~= hs.application.watcher.activated then
				return
			end
			for _, app in ipairs(config.apps) do
				if app.id == appObj:bundleID() and app.ime then
					hs.keycodes.currentSourceID(app.ime)
					break
				end
			end
		end)
		:start()
end

return M
