local M = {
  -- "folke/tokyonight.nvim",
  "rodvicj/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("tokyonight").setup {
    on_highlights = function(hl, c)
      hl.rainbowcol1 = { fg = "Gold" }
      hl.rainbowcol2 = { fg = "Orchid" }
      hl.rainbowcol3 = { fg = "DodgerBlue" }

      --prevent unnecessary highlight in top winbar when splitting view
      hl.WinBar = { link = "none" }
      hl.WinBarNC = { link = "none" }

      -- default for CursorLine { fg = c.orange, bold = true }
      hl.CursorLineNr = { fg = c.dark5, bold = false }

      -- IndentBlanklineChar        = { fg = c.fg_gutter, nocombine = true },
      -- IndentBlanklineContextChar = { fg = c.blue1, nocombine = true },
      -- IblIndent                  = { fg = c.fg_gutter, nocombine = true },
      -- IblScope                   = { fg = c.blue1, nocombine = true },

      -- hl.IblIndent = { fg = c.fg_gutter, nocombine = true }
      -- c.comment == "#565f89"
      hl.IblScope = { fg = c.comment, nocombine = true }
    end,
  }

  vim.cmd.colorscheme "tokyonight-storm"
end

return M
