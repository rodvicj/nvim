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

      hl.IndentLine = { fg = c.orange, bold = true }
      -- IndentLine = { fg = c.fg_gutter, nocombine = true },
      -- IndentLineCurrent = { fg = c.blue1, nocombine = true },
    end,
  }

  vim.cmd.colorscheme "tokyonight-storm"
  -- vim.cmd.colorscheme "onedarker"
end

return M
