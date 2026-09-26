local M = {}

-- bufferline.nvim creates a separate selected highlight for every devicon.
-- Give those generated icon groups the same background as the selected label.
local function sync_bufferline_selected_icons()
  local selected = vim.api.nvim_get_hl(0, { name = "BufferLineBufferSelected", link = false })
  if not selected.bg then
    return
  end

  for name, icon in pairs(vim.api.nvim_get_hl(0, { link = false })) do
    if name:match("^DevIcon") then
      vim.api.nvim_set_hl(0, "BufferLine" .. name .. "Selected", {
        fg = icon.fg,
        bg = selected.bg,
        bold = false,
        italic = false,
      })
    end
  end
end

M.config = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },
  on_colors = nil,
  on_highlights = nil,
}

---@param opts? table
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  vim.o.background = "dark"
  local colors = require("darkmonochrome.colors").setup(M.config)
  local highlights = require("darkmonochrome.highlights").setup(colors, M.config)

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "darkmonochrome"

  if M.config.terminal_colors then
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = "#B07070"
    vim.g.terminal_color_2 = "#80A680"
    vim.g.terminal_color_3 = "#B0A670"
    vim.g.terminal_color_4 = "#8096B0"
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = "#A6A6A6"
    vim.g.terminal_color_8 = "#3D3D3D"
    vim.g.terminal_color_9 = "#B07070"
    vim.g.terminal_color_10 = "#80A680"
    vim.g.terminal_color_11 = "#B0A670"
    vim.g.terminal_color_12 = "#8096B0"
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.white
  end

  for group, value in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, value)
  end

  sync_bufferline_selected_icons()

  -- Devicons can be loaded lazily, after the colorscheme itself. Run once the
  -- bufferline has rendered as well, so its generated icon groups are updated.
  local group = vim.api.nvim_create_augroup("DarkMonochromeBufferline", { clear = true })
  vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
    group = group,
    callback = function()
      if vim.g.colors_name == "darkmonochrome" then
        vim.defer_fn(sync_bufferline_selected_icons, 10)
      end
    end,
  })
end

return M
