local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- core
config.term = "xterm-256color"

--- colorscheme
config.color_scheme = "Tokyo Night Storm"

--- UI
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_padding = {
  left = 1,
  right = 1,
  top = 1,
  bottom = 1,
}

--- font
config.font_size = 18
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"Maple Mono NF CN",
})
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
