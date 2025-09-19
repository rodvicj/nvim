local M = {
  "dstein64/nvim-scrollview",
  event = "VeryLazy",
}

function M.config()
  require("scrollview").setup {
    cursor_symbol = ".",
    -- winblend = 50,
    signs_on_startup = {
      "conflicts",
      "cursor",
      -- "diagnostics",
      "folds",
      "loclist",
      "marks",
      "quickfix",
      "search",
      "spell",
      -- "textwidth",
      -- "trail",
    },
    current_only = true,
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "alpha",
      "NvimTree",
      "",
    },
  }

  -- vim.api.nvim_set_hl(0, "ScrollView", { link = "Visual" })
end

return M
