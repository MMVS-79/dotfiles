local wezterm = require 'wezterm'

return {
  -- Window Size
  initial_cols = 300,
  initial_rows = 300,

  -- Font Settings
  font = wezterm.font("Iosevka"),
  font_size = 16,

  -- Color Scheme (using Wez theme)
  color_scheme = "Wez",

  -- Additional settings for window appearance
  --  window_background_opacity = 0.95,  -- Optional: tweak transparency if you want
  use_fancy_tab_bar = false,         -- Optional: disable fancy tab bar if you prefer simpler appearance
}
