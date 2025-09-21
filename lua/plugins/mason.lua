local M = {
  "williamboman/mason-lspconfig.nvim",
  tag = "v1.32.0",
  dependencies = {
    "williamboman/mason.nvim",
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
      "basedpyright",
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
end

return M
