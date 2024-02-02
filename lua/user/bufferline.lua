local highlights = {
  background = {
    italic = true,
    bold = false,
  },
  buffer_selected = {
    italic = false,
    bold = false,
  },
  numbers = {
    italic = false,
    bold = false,
  },
  numbers_selected = {
    italic = false,
    bold = false,
  },
}

local options = {
  mode = "buffers",
  always_show_bufferline = true,
  animation = false,
  auto_hide = false,
  icons = "both",
  icon_custom_colors = true,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab = "",
  icon_close_tab_modified = "●",
  offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
  show_buffer_icons = true,
  show_buffer_close_icons = true,
  show_close_icon = false,
  show_tab_indicators = false,
  separator_style = "slant",
  -- enforce_regular_tabs = true,
  numbers = function(opts)
    return string.format("%s", opts.ordinal)
    -- return string.format("%s", opts.raise(opts.ordinal))
  end,
}

local M = {
  "akinsho/bufferline.nvim",
  opts = {
    options = options,
    highlights = highlights,
  },
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

vim.opt.termguicolors = true

return M
