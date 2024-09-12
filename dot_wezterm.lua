local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action
local font_name = "JetBrainsMono Nerd Font"

config.initial_cols = 110
config.initial_rows = 26
config.font_size = 14
config.font = wezterm.font(font_name)
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font(font_name, { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font(font_name, { weight = "Bold", stretch = "Normal", style = "Italic" }),
	},
}
-- Disable italics terminal-wide
-- config.font_rules = {
-- 	{
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			family = "JetBrainsMono Nerd Font",
-- 			italic = false,
-- 		}),
-- 	},
-- }
config.color_scheme = "catppuccin-mocha"
config.enable_scroll_bar = false
config.scrollback_lines = 35000
config.unzoom_on_switch_pane = true

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.keys = {
	{ mods = "SUPER",       key = "d", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "SUPER|SHIFT", key = "d", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "SUPER|SHIFT", key = "z", action = act.TogglePaneZoomState },
	{ mods = "SUPER",       key = "[", action = act.ActivatePaneDirection("Prev") },
	{ mods = "SUPER",       key = "]", action = act.ActivatePaneDirection("Next") },
}

return config
