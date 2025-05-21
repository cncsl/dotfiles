local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- core
config.term = "xterm-256color"
config.leader = {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 3000,
}
config.keys = config.keys or {}
table.insert(config.keys, {
  key = "a",
  mods = "LEADER|CTRL",
  action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
})

--- colorscheme
config.color_scheme = "Tokyo Night Storm"

--- font
config.font_size = 18
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" })
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

require("tabline").apply_to_config(config)
require("multiplexing").apply_to_config(config)

--- Copy Mode
config.keys = config.keys or {}
table.insert(config.keys, {
  key = "v",
  mods = "LEADER",
  action = wezterm.action.ActivateCopyMode,
})

--- Search Mode
config.keys = config.keys or {}
table.insert(config.keys, {
  key = "/",
  mods = "LEADER",
  action = wezterm.action.Search({ CaseInSensitiveString = "" }),
})

--- QuickSelect Mode
table.insert(config.keys, {
  key = "f",
  mods = "LEADER",
  action = wezterm.action.QuickSelect,
})

return config
