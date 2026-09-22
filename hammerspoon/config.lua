local ime = {
	DEFAULT = "com.apple.keylayout.ABC",
	CHINESE_IME = "com.apple.inputmethod.SCIM.ITABC",
}

return {
	hyper = { "cmd", "alt", "ctrl" },

	modes = {
		apps = "o",
		window_mgr = "w",
		cheatsheet = "z",
	},

	spoons = {
		"WinWin",
		"FnMate",
		"KSheet",
	},

	ime_list = ime,

	apps = {
		{ key = "f", name = "Finder", id = "com.apple.finder" },
		{ key = "b", name = "Google Chrome", id = "com.google.Chrome", direct = true },
		{ key = "t", name = "Ghostty", id = "com.mitchellh.ghostty", direct = true },
		{ key = "i", name = "Jetbrains Intellij IDEA", id = "com.jetbrains.intellij", direct = true },
		{ key = "x", name = "微信", id = "com.tencent.xinWeChat", ime = ime.CHINESE_IME, direct = true },
		{ key = "c", name = "企业微信", id = "com.tencent.WeWorkMac", ime = ime.CHINESE_IME, direct = true },
	},

	windowMgr_keys = {
		stepMove = {
			{ direction = "up", key = "w", label = "Move Upward" },
			{ direction = "down", key = "s", label = "Move Downward" },
			{ direction = "left", key = "a", label = "Move Leftward" },
			{ direction = "right", key = "d", label = "Move Rightward" },
		},
		stepResize = {
			{ direction = "up", key = "k", label = "Move Upward" },
			{ direction = "down", key = "j", label = "Move Downward" },
			{ direction = "left", key = "h", label = "Move Leftward" },
			{ direction = "right", key = "l", label = "Move Rightward" },
		},
		moveAndResize = {
			{ key = "h", mode = "halfleft", label = "Left Half" },
			{ key = "l", mode = "halfright", label = "Right Half" },
			{ key = "k", mode = "halfup", label = "Top Half" },
			{ key = "j", mode = "halfdown", label = "Bottom Half" },

			{ key = "y", mode = "cornerNW", label = "NorthWest Corner" },
			{ key = "o", mode = "cornerNE", label = "NorthEast Corner" },
			{ key = "u", mode = "cornerSW", label = "SouthWest Corner" },
			{ key = "i", mode = "cornerSE", label = "SouthEast Corner" },

			{ key = "f", mode = "fullscreen", label = "Fullscreen" },
			{ key = "c", mode = "center", label = "Center Window" },

			{ key = "=", mode = "expand", label = "Stretch Outward" },
			{ key = "-", mode = "shrink", label = "Shrink Inward" },
		},
		moveToScreen = {
			{ key = "left", direction = "left", label = "Move to Left Monitor" },
			{ key = "right", direction = "right", label = "Move to Right Monitor" },
		},
		undo = {
			key = "delete",
			label = "Undo Window Manipulation",
		},
		centerCursor = {
			key = "`",
			label = "Center Cursor",
		},
	},
}
