-- return {
--   "petertriho/nvim-scrollbar",
--   -- Highly recommended dependencies to populate the scrollbar with useful marks
--   dependencies = {
--     "lewis6991/gitsigns.nvim",
--     "kevinhwang91/nvim-hlslens",
--   },
--   -- Ensures it only loads when you start editing/reading a buffer
--   event = { "BufReadPost", "BufNewFile" },
--   opts = {
--     -- Enable standard integrations out of the box
--     handlers = {
--       gitsigns = true,
--       search = true,
--     },
--     -- Custom colors or handle configuration (optional)
--     handle = {
--       text = " ",
--       blend = 30, -- 0 for fully opaque, 100 for transparent
--       color = nil, -- Uses theme default, or specify a hex color like "#61afef"
--     },
--     marks = {
--       -- Customize search, diagnostics, and git diff color/positions if desired
--       Search = { color = "#ff9e64" },
--       Error  = { color = "#db4b4b" },
--       Warn   = { color = "#e0af68" },
--       Info   = { color = "#0db9d7" },
--       Hint   = { color = "#1abc9c" },
--     },
--   },
-- }


return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  opts = {
    show = true,
    show_in_active_only = true,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    handle = {
      text = " ",
      color = "#4f4f4f",
      cterm = nil,
      -- highlight = "CursorColumn",
      hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
      Cursor = {
        -- text = "•",
        text = "─",
        priority = 0,
        color = "#ff9e64",
        cterm = nil,
        -- highlight = "Normal",
      },
      Search = {
        -- text = { "-", "=" },
        text = { "=" },
        priority = 1,
        -- color = nil,
        color = "#ff9e64",
        -- cterm = nil,
        highlight = "Search",
      },
      Error = {
        text = { "-", "=" },
        priority = 2,
        color = nil,
        cterm = nil,
        highlight = "DiagnosticVirtualTextError",
      },
      Warn = {
        text = { "-", "=" },
        priority = 3,
        color = nil,
        cterm = nil,
        highlight = "DiagnosticVirtualTextWarn",
      },
      Info = {
        text = { "-", "=" },
        priority = 4,
        color = nil,
        cterm = nil,
        highlight = "DiagnosticVirtualTextInfo",
      },
      Hint = {
        text = { "-", "=" },
        priority = 5,
        color = nil,
        cterm = nil,
        highlight = "DiagnosticVirtualTextHint",
      },
      Misc = {
        text = { "-", "=" },
        priority = 6,
        color = nil,
        cterm = nil,
        highlight = "Normal",
      },
      GitAdd = {
        text = "┆",
        priority = 7,
        color = nil,
        cterm = nil,
        highlight = "GitSignsAdd",
      },
      GitChange = {
        text = "┆",
        priority = 7,
        color = nil,
        cterm = nil,
        highlight = "GitSignsChange",
      },
      GitDelete = {
        text = "▁",
        priority = 7,
        color = nil,
        cterm = nil,
        highlight = "GitSignsDelete",
      },
    },
    excluded_buftypes = {
      "terminal",
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "alpha",
      "NvimTree",
      -- "",
    },
    autocmd = {
      render = {
        "BufWinEnter",
        "TabEnter",
        "TermEnter",
        "WinEnter",
        "CmdwinLeave",
        "TextChanged",
        "VimResized",
        "WinScrolled",
      },
      clear = {
        "BufWinLeave",
        "TabLeave",
        "TermLeave",
        "WinLeave",
      },
    },
    handlers = {
      cursor = true,
      diagnostic = false,
      gitsigns = false, -- Requires gitsigns
      handle = true,
      search = true, -- Requires hlslens
    },
  },
  config = function(_, opts)
    local opt = { noremap = true, silent = true }
    vim.keymap.set(
      "n",
      "n",
      "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>",
      opt
    )
    vim.keymap.set(
      "n",
      "N",
      "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>",
      opt
    )
    vim.keymap.set("n", "#", "#<CMD>lua require('hlslens').start()<CR>", opt)

    require("scrollbar.handlers.search").setup {
      override_lens = function() end,
    }

    require("scrollbar").setup(opts)
  end,
}
