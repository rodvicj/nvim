local M = {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
}


function M.config()
  local rainbow_delimiters = require "rainbow-delimiters"

  require("rainbow-delimiters.setup").setup {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
    },
    query = {
      [""] = "rainbow-delimiters",
      javascript = "rainbow-delimiters",
      tsx = "rainbow-parens",
    },
    highlight = {
      "rainbowcol1",
      "rainbowcol2",
      "rainbowcol3",
    },
    blacklist = { "html" },
  }
end

return M


--  -- settings for my customized rainbow-delimiters
-- local M = {
--   "rodvicj/rainbow-delimiters.nvim",
--   event = "VeryLazy",
-- }


-- function M.config()
--   local rainbow_delimiters = require "rainbow-delimiters"

--   require("rainbow-delimiters.setup").setup {
--     strategy = {
--       [""] = rainbow_delimiters.strategy["global"],
--     },
--     query = {
--       [""] = "rainbow-delimiters",
--       -- removed unnecessary highlighting in rodvicj/rainbow-delimiters.nvim
--       -- javascript, tsx, astro
--       javascript = "rainbow-delimiters-react",
--       -- html = "rainbow-parens",
--       -- htmldjango = "rainbow-delimiters",
--       -- NOTE: create highlighting for htmldjango if using it heavily but first you have to work with treesitter's htmldjango first;
--     },
--     highlight = {
--       "rainbowcol1",
--       "rainbowcol2",
--       "rainbowcol3",
--     },
--     blacklist = { "html" },
--   }
-- end

-- return M
