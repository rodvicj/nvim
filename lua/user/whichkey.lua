-- local M = {
--   "folke/which-key.nvim",
-- }

-- function M.config()
--   local mappings = {
--     a = {
--       name = "Tab",
--       n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
--       N = { "<cmd>tabnew %<cr>", "New Tab" },
--       o = { "<cmd>tabonly<cr>", "Only" },
--       h = { "<cmd>-tabmove<cr>", "Move Left" },
--       l = { "<cmd>+tabmove<cr>", "Move Right" },
--     },
--   }

--   local which_key = require "which-key"
--   which_key.setup {
--     plugins = {
--       marks = false,
--       registers = true,
--       spelling = {
--         enabled = true,
--         suggestions = 20,
--       },
--       presets = {
--         operators = false,
--         motions = false,
--         text_objects = false,
--         windows = false,
--         nav = false,
--         z = false,
--         g = false,
--       },
--     },
--     window = {
--       border = "rounded",
--       position = "bottom",
--       padding = { 2, 2, 2, 2 },
--     },
--     ignore_missing = true,
--     show_help = false,
--     show_keys = false,
--     disable = {
--       buftypes = {},
--       filetypes = { "TelescopePrompt" },
--     },
--   }

--   local opts = {
--     mode = "n", -- NORMAL mode
--     prefix = "<leader>",
--   }

--   which_key.register(mappings, opts)
-- end

-- return M

return {

  -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          -- { "<leader><tab>", group = "tabs" },
          { "<leader>a", group = "Tab" },
          { "<leader>b", group = "Buffers" },
          { "<leader>d", group = "Debug" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "<leader>l", group = "LSP" },
          { "<leader>p", group = "Plugins" },
          { "<leader>t", group = "Test" },
          { "<leader>T", group = "Treesitter" },
          -- { "<leader>q", group = "quit/session" },
          -- { "[", group = "prev" },
          -- { "]", group = "next" },
          -- { "g", group = "goto" },
          -- { "gs", group = "surround" },
          -- { "z", group = "fold" },
        },
      },
    },
    keys = {

      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
      { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
      { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
      { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
      { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
      { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
      { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
    end,
  },
}
