local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    -- ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
    ["<c-_>"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
    ["<c-/>"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  }

  wk.register {
    ["<c-_>"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment", mode = "v" },
    ["<c-/>"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment", mode = "v" },
  }

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    config = {
      htmldjango = "{#%s#}",
      -- html = "<!--%s-->",
    },
    enable_autocmd = false,
  }

  require("Comment").setup {
    -- ignores empty lines
    ignore = "^$",
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
