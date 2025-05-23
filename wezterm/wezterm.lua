local wezterm = require 'wezterm'

return {
  -- Be explicit with font variant for faster resolution
  font = wezterm.font("Iosevka", {
    weight = "Regular",
    stretch = "Normal",
    italic = false,
  }),

  font_size = 15.0,

  -- Reasonable upper limits for startup size (macOS will cap this anyway)
  initial_rows = 100,
  initial_cols = 340,

  -- Avoid resizing on font size change
  adjust_window_size_when_changing_font_size = false,
}

