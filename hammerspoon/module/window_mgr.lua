local M = {}

function M.init(config)
	----------------------------------------------------------------------------------------------------
	if spoon.WinWin then
		spoon.ModalMgr:new("windowManage")
		local cmodal = spoon.ModalMgr.modal_list["windowManage"]
		cmodal:bind("", "escape", "Deactivate window manage", function()
			spoon.ModalMgr:deactivate({ "windowManage" })
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

		-- Register windowManage with modal supervisor
		spoon.ModalMgr.supervisor:bind(
			config.hyper,
			config.modes.window_mgr,
			"Enter windowManage Environment",
			function()
				-- Deactivate some modal environments or not before activating a new one
				spoon.ModalMgr:deactivateAll()
				-- Show an status indicator so we know we're in some modal environment now
				spoon.ModalMgr:activate({ "windowManage" }, "#B22222")
			end
		)
	end
end

return M
