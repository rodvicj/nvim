local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  commit = "98767d37f8e5255a5111fc1e3163232d4dc07bda", -- Commits on March 25, 2025
}

function M.config()
  require("mason-tool-installer").setup {
    ensure_installed = {
      "stylua",
      "prettier",
      "eslint",
      "djlint",
    },
  }
end

return M
