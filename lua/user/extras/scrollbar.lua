local M = {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
}

--     set_keymap( "n", "n", "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--     set_keymap( "n", "N", "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--     set_keymap("n", "*", "*<CMD>lua require('hlslens').start()<CR>", opts)
--     set_keymap("n", "#", "#<CMD>lua require('hlslens').start()<CR>", opts)
--     set_keymap("n", "g*", "g*<CMD>lua require('hlslens').start()<CR>", opts)
--     set_keymap("n", "g#", "g#<CMD>lua require('hlslens').start()<CR>", opts)

-- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up"),

local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "n", "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", opts)
-- vim.keymap.set("n", "N", "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", opts)
vim.keymap.set("n", "#", "#<CMD>lua require('hlslens').start()<CR>", opts)

function M.config()
  require("scrollbar.handlers.search").setup {
    override_lens = function() end,
  }

  require("scrollbar").setup {
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
        color = "#7f7f7f",
        cterm = nil,
        -- highlight = "Normal",
      },
      Search = {
        -- text = { "-", "=" },
        text = { "=" },
        priority = 1,
        -- color = nil,
        color = "#565f89",
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
      "",
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
  }
end

return M
