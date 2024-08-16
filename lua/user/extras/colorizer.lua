local M = {
  -- "NvChad/nvim-colorizer.lua",
  "ChristianChiarulli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "scss",
      "html",
      "astro",
      "lua",
      "json",
    },
    user_default_options = {
      names = false,
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      tailwind = "both",

      -- names = false,
      -- RGB = false, -- #RGB hex codes
      -- RRGGBB = false, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      -- AARRGGBB = false, -- 0xAARRGGBB hex codes
      -- css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- tailwind = "false",
    },
    buftypes = {},
  }
end

return M
