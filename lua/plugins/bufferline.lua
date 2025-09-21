return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "echasnovski/mini.icons",

  -- `keys` are defined directly in the plugin spec.
  -- lazy.nvim will automatically handle these.
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },

  -- `opts` are passed to the plugin's setup function.
  opts = {
    highlights = {
      background = { italic = true, bold = false },
      buffer_selected = { italic = false, bold = false },
      numbers = { italic = false, bold = false },
      numbers_selected = { italic = false, bold = false },
    },
    options = {
      mode = "buffers",
      always_show_bufferline = true,
      animation = false,
      auto_hide = false,
      icons = "both",
      icon_custom_colors = true,
      icon_separator_active = "▎",
      icon_separator_inactive = "▎",
      close_command = function(bufnr)
        BufferKill("bd", bufnr, false)
      end,
      icon_close_tab = "",
      icon_close_tab_modified = "●",
      offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = false,
      separator_style = "slant",
      numbers = function(opts)
        return string.format("%s", opts.ordinal)
      end,
    },
  },

  -- The `config` function is the ideal place for setup code that
  -- needs to run AFTER the plugin has been loaded.
  config = function(_, opts)
    -- Apply the plugin's options
    require("bufferline").setup(opts)
    -- Configure which-key mappings. This is a side-effect that
    -- should happen during configuration, not during definition.
    local wk = require "which-key"
    wk.add {
      { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", hidden = true },
      { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", hidden = true },
      { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", hidden = true },
      { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", hidden = true },
      { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", hidden = true },
      { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", hidden = true },
      { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", hidden = true },
      { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", hidden = true },
      { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", hidden = true },
      { "<leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", hidden = true },
    }
  end,
}
