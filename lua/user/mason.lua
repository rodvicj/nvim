local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "cssls",
      "html",
      "ts_ls",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "tailwindcss",
      "rust_analyzer",
      "ruff",
    },
  }

  require("mason-tool-installer").setup {
    ensure_installed = {
      "stylua",
      "prettier",
      "eslint",
      "flake8",
      "black",
      "djlint",
    },
  }
end

return M
