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
      "html",
      "astro",
      "lua",
      "json",
    },
    user_default_options = {
      names = false,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = "both",
    },
    buftypes = {},
  }
end

return M
