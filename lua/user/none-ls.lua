local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,

      -- for htmldjango
      formatting.djlint.with {
        -- extra_filetypes = { "html", "htmldjango" },
        extra_args = { "--indent=2", "--max-blank-lines=1", "--blank-line-after-tag=extends", "--close-void-tags" },
        -- extra_args = { "--indent=2", "--max-blank-lines=1", "--blank-line-after-tag=load, extends, include, endblock" },
      },
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      null_ls.builtins.diagnostics.flake8.with {
        extra_args = { "--ignore=E501,E203,F821,F401,W504" },
      },
      -- diagnostics.flake8,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
