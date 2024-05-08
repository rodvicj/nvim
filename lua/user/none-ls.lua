local M = {
  "nvimtools/none-ls.nvim",
  -- commit = "bb680d752cec37949faca7a1f509e2fe67ab418a", -- before deprecation of some null-ls builtins
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  -- local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      require "none-ls.diagnostics.eslint_d",
      require("none-ls.diagnostics.flake8").with {
        extra_args = { "--ignore=E501,E203,F821,F401,W504,E303,W292" },
      },
      formatting.stylua,
      formatting.prettier,
      formatting.black,

      -- for htmldjango
      formatting.djlint.with {
        -- extra_filetypes = { "html", "htmldjango" },
        extra_args = { "--indent=2", "--max-blank-lines=1", "--blank-line-after-tag=extends", "--close-void-tags" },
      },
      null_ls.builtins.completion.spell,
    },
  }
end

return M
