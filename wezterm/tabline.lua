local wezterm = require("wezterm")

local M = {}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

function M.apply_to_config(config)
	config.hide_tab_bar_if_only_one_tab = false
	tabline.setup({
		options = {
			icons_enabled = true,
			tabs_enabled = true,
			theme_overrides = {},
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = "",
			tab_separators = "",
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "workspace" },
			tabline_c = { "" },
			tab_active = {
				"index",
				{ "parent", padding = 0 },
				"/",
				{ "cwd",    padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = {},
			tabline_y = {},
			tabline_z = { "domain" },
		},
		extensions = {},
	})
	tabline.apply_to_config(config)
end

return M
