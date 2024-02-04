local M = {
  "rodvicj/rainbow-delimiters.nvim",
  event = "VeryLazy",
}

local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
  return
end

-- custom colors for rainbow highlights
tokyonight.setup {
  on_highlights = function(hl)
    hl.rainbowcol1 = { fg = "Gold" }
    hl.rainbowcol2 = { fg = "Orchid" }
    hl.rainbowcol3 = { fg = "DodgerBlue" }
  end,
  -- use the night style
  style = "storm",
}

function M.config()
  local rainbow_delimiters = require "rainbow-delimiters"

  require("rainbow-delimiters.setup").setup {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
    },
    query = {
      [""] = "rainbow-delimiters",
      -- removed unnecessary highlighting in rodvicj/rainbow-delimiters.nvim
      -- javascript, tsx, astro
      javascript = "rainbow-delimiters-react",
      html = "rainbow-parens",
      -- htmldjango = "rainbow-delimiters",
      -- NOTE: create highlighting for htmldjango if using it heavily but first you have to work with treesitter's htmldjango first;
    },
    highlight = {
      "rainbowcol1",
      "rainbowcol2",
      "rainbowcol3",
    },
    -- blacklist = { "html" },
  }
end

return M
