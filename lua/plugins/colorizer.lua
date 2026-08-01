local M = {
  -- "ChristianChiarulli/nvim-colorizer.lua",
  -- "rodvicj/nvim-colorizer.lua",
  -- "catgoose/nvim-colorizer.lua",
  -- commit = "ef211089af881bea206c7aa3f2693a81feee7e90",
  "rodvicj/nvim-colorizer.lua",
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
      "conf",
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
