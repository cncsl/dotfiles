local M = {}

local modeName = "cheatsheet"

function M.init(config)
	if spoon.KSheet then
		spoon.ModalMgr:new(modeName)
		local cmodal = spoon.ModalMgr.modal_list[modeName]
		cmodal:bind("", "escape", "Deactivate cheatsheet", function()
			spoon.KSheet:hide()
			spoon.ModalMgr:deactivate({ modeName })
		end)

		-- Register cheatsheetM with modal supervisor
		spoon.ModalMgr.supervisor:bind(
			config.hyper,
			config.modes.cheatsheet,
			"Open cheatsheet for current App",
			function()
				spoon.KSheet:show()
				spoon.ModalMgr:deactivateAll()
				spoon.ModalMgr:activate({ modeName })
			end
		)
	end
end

return M
