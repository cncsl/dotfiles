local M = {}

function M.init(config)
	hs.loadSpoon("ClipboardTool")

	spoon.ClipboardTool.hist_size = 500
	spoon.ClipboardTool.frequency = 0.8
	spoon.ClipboardTool.show_copied_alert = false
	spoon.ClipboardTool.show_in_menubar = false
	spoon.ClipboardTool.paste_on_select = true

	spoon.ClipboardTool:bindHotkeys({
		show_clipboard = { { "cmd", "shift" }, "v" },
	})

	spoon.ClipboardTool:start()
end

return M
