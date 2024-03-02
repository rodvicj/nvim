local M = {
  "nvimtools/none-ls.nvim",
  commit = "bb680d752cec37949faca7a1f509e2fe67ab418a", -- before deprecation of some null-ls builtins
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

-- -- Never request typescript-language-server for formatting
-- vim.lsp.buf.format {
--   filter = function(client)
--     return client.name ~= "tsserver"
--   end,
-- }



function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  -- require('none-ls.diagnostics.flake8').with({
  --   extra_args = { '--max-line-length', '100' },
  -- }),

  -- M.diagnostics.flake8.with ({
  --   extra_args = { "--ignore=E501,E203,F821,F401,W504" },
  -- })


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
      --   filetypes = { "html", "css" },
      --   -- extra_filetypes = { "html", "css" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      diagnostics.flake8.with {
        extra_args = { "--ignore=E501,E203,F821,F401,W504" },
      },
      -- diagnostics.flake8,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
