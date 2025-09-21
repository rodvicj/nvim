return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ops = {
    pugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      border = "rounded",
    },
    show_help = false,
    show_keys = false,
    -- triggers = true, -- automatically setup triggers
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  },
  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)

    -- Document existing key chains using new spec format
    wk.add {
      { "<leader>b", group = "Buffers" },
      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>p", group = "Plugins" },
      { "<leader>t", group = "Test" },
      { "<leader>T", group = "Treesitter" },
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
      { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
      { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
      { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
      { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
      { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
      { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    }
  end,
}
