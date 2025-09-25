local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts_extend = { "spec" }

  -- wk.add {
  --   mode = { "n", "v" },
  --   -- { "<leader><tab>", group = "tabs" },
  --   { "<leader>a", group = "Tab", mode = "n", "v" },
  --   { "<leader>b", group = "Buffers", mode = "n", "v" },
  --   { "<leader>d", group = "Debug", mode = "n", "v" },
  --   { "<leader>f", group = "Find", mode = "n", "v" },
  --   { "<leader>g", group = "Git", mode = "n", "v" },
  --   { "<leader>l", group = "LSP", mode = "n", "v" },
  --   { "<leader>p", group = "Plugins", mode = "n", "v" },
  --   { "<leader>t", group = "Test", mode = "n", "v" },
  --   { "<leader>T", group = "Treesitter", mode = "n", "v" },
  -- }

M.opts = {
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
    },
  },
  plugins = {
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
    -- padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    -- padding = { 2, 2, 2, 2 }, -- extra window padding [top/bottom, right/left]
    -- title = true,
    -- title_pos = "center",
    -- zindex = 1000,
    -- Additional vim.wo and vim.bo options
    -- bo = {},
    -- wo = {
    -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    -- },
  },
  show_help = false,
  show_keys = false,
  -- triggers = true, -- automatically setup triggers
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}
M.keys = {
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

M.config = function(_, opts)
  local wk = require "which-key"
  wk.setup(opts)
end

return M

-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {
--     plugins = {
--       marks = false,
--       registers = false,
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
--     win = {
--       -- don't allow the popup to overlap with the cursor
--       no_overlap = true,
--       -- width = 1,
--       -- height = { min = 4, max = 25 },
--       -- col = 0,
--       -- row = math.huge,
--       border = "rounded",
--     },
--     show_help = false,
--     show_keys = false,
--     -- triggers = true, -- automatically setup triggers
--     disable = {
--       buftypes = {},
--       filetypes = { "TelescopePrompt" },
--     },
--   },
--   config = function(_, opts)
--   -- config = function()
--     local wk = require "which-key"
--     wk.setup(opts)

--     wk.add {
--       { "<leader>b", group = "Buffers" },
--       { "<leader>d", group = "Debug" },
--       { "<leader>f", group = "Find" },
--       { "<leader>g", group = "Git" },
--       { "<leader>l", group = "LSP" },
--       { "<leader>p", group = "Plugins" },
--       { "<leader>t", group = "Test" },
--       { "<leader>T", group = "Treesitter" },
--       { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
--       { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
--       { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
--       { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
--       { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
--       { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
--       { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
--     }
--   end,
-- }
