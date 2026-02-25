local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

function M.apply_to_config(config)
	local keys = config.keys or {}
	-- new tab
	table.insert(keys, {
		key = "n",
		mods = "LEADER",
		action = act.SpawnTab("DefaultDomain"),
	})
	-- close current tab
	table.insert(keys, {
		key = "Q",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	})

	-- select tab by index
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end

	table.insert(keys, {
		key = "Space",
		mods = "LEADER",
		action = act.RotatePanes("CounterClockwise"),
	})
	-- split vertical
	table.insert(keys, {
		key = "_",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	})
	-- split horizontal
	table.insert(keys, {
		key = "|",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	})
	-- close current pane
	table.insert(keys, {
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	})

	config.keys = keys
	smart_splits.apply_to_config(config, {
		direction_keys = { "h", "j", "k", "l" },
		modifiers = {
			move = "CTRL",
			resize = "META",
		},
		log_level = "info",
	})
end

return M
