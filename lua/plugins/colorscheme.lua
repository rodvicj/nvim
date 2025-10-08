return {
  "folke/tokyonight.nvim",
  -- "rodvicj/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local Util = require "tokyonight.util"

    require("tokyonight").setup {
      on_highlights = function(hl, c)
        hl.rainbowcol1 = { fg = "Gold" }
        hl.rainbowcol2 = { fg = "Orchid" }
        hl.rainbowcol3 = { fg = "DodgerBlue" }

        -- hl["@tag.builtin"] = "Label"
        hl["@tag.builtin"] = { fg = c.magenta }
        -- hl["@attribute.builtin"] = "PreProc"
        -- hl["@attribute.builtin"] = { fg = c.cyan }

        -- WARNING: check what this highlights corresponds to;
        -- hl["@attribute.builtin"] = { fg = "#ff0000", bold = true }
        -- FOUND: python @builtin function like
        --   -- @staticmethod
        --   -- def post(request):
        --   --     serializer = LoginSerializer(data=request.data)

        -- hl["@tag.delimiter.tsx"] = { fg = Util.blend_bg(c.blue, 0.7) }
        hl["@tag.delimiter"] = { fg = Util.blend_bg(c.blue, 0.7) }

        -- -- hardcoded
        -- hl["@tag.delimiter"] = { fg = "#607dbf" }
        -- -- use to get hl["@tag.delimiter"] hex color
        -- print("@tag.delimiter", Util.blend_bg(c.blue, 0.7))

        --prevent unnecessary highlight in top winbar when splitting view

        -- -- NOTE: temporarily commented used before for indentBlankLine to remove upper winbar highlight
        -- hl.WinBar = { link = "none" }
        -- hl.WinBarNC = { link = "none" }

        -- default for CursorLine { fg = c.orange, bold = true }
        hl.CursorLineNr = { fg = c.dark5, bold = false }

        -- hl.MarkSignHL = { fg = c.comment, bold = false }
        -- hl.MarkSignNumHL = { fg = c.comment, bold = false }
        -- hl.MarkVirtTextHL = { fg = c.comment, bold = false }

        -- hl.MarkSignHL = {link = "none"}
        -- hl.MarkSignNumHL = {link = "none"}
        -- hl.MarkVirtTextHL = {link = "none"}

        -- MarkSignHL
        -- MarkSignNumHL
        -- MarkVirtTextHL

        -- IndentBlanklineChar        = { fg = c.fg_gutter, nocombine = true },
        -- IndentBlanklineContextChar = { fg = c.blue1, nocombine = true },
        -- IblIndent                  = { fg = c.fg_gutter, nocombine = true },
        -- IblScope                   = { fg = c.blue1, nocombine = true },

        -- hl.IblIndent = { fg = c.fg_gutter, nocombine = true }
        -- c.comment == "#565f89"

        -- indent line colors
        -- hl.IblScope = { fg = c.comment, nocombine = true }
        -- hl.IndentLineCurrent = { fg = c.comment, nocombine = true }
        -- hl.IndentLine = { fg = c.comment, nocombine = true }

        -- make windows picker choice brighter when picking for new file in virtical split window
        hl.StatusLineNC = { fg = c.orange, nocombine = true }

      end,
    }

    vim.cmd.colorscheme "tokyonight-storm"
  end,
}
