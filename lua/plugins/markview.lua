return {
  "nvim-treesitter/nvim-treesitter",
  -- "neovim-treesitter/nvim-treesitter",
  dependencies = { "OXY2DEV/markview.nvim" },
  lazy = false,
  config = function()
    -- Disable automatic previews.
    require("markview").setup {
      preview = { enable = false },
    }
  end,

  vim.api.nvim_set_keymap("n", "<leader>mm", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." }),

  vim.api.nvim_set_keymap(
    "n",
    "<leader>mv",
    "<CMD>Markview splitToggle<CR>",
    { desc = "Toggles `splitview` for current buffer." }
  ),
}
