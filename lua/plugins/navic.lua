local M = {
  "SmiteshP/nvim-navic",
}

function M.config()
  require("nvim-navic").setup {
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " " .. "➤" .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end

return M
