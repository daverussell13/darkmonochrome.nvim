local M = {}

function M.setup(config)
  local c = {
    bg = "#080808",
    surface = "#121212",
    surface_hover = "#1A1A1A",
    surface_active = "#222222",
    border = "#1A1A1A",
    border_strong = "#303030",
    fg = "#C0C0C0",
    fg_bright = "#E0E0E0",
    fg_emphasis = "#D0D0D0",
    fg_muted = "#848484",
    fg_disabled = "#666666",
    white = "#FFFFFF",
    black = "#000000",
    red = "#AF8F8F",
    green = "#8FAF8F",
    yellow = "#A9A477",
    blue = "#8FA3AF",
    magenta = "#A680A6",
    cyan = "#80A6A6",
    red_bg = "#211919",
    green_bg = "#182018",
    yellow_bg = "#211F16",
    blue_bg = "#181D20",

    -- Editor-specific roles derived exclusively from the palette above.
    cursor_line = "#121212",
    selection = "#1A1A1A",
    match = "#222222",
    gutter = "#666666",
    hint = "#80A6A6",
    debug = "#848484",
    git_add = "#8FAF8F",
    git_change = "#8FA3AF",
    git_delete = "#AF8F8F",
    git_add_bg = "#182018",
    git_change_bg = "#181D20",
    git_delete_bg = "#211919",
    search_fg = "#FFFFFF",
    search_bg = "#303030",
  }

  if config.transparent then
    c.bg = "NONE"
  end
  if config.on_colors then
    config.on_colors(c)
  end
  return c
end

return M
