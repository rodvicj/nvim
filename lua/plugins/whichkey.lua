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

-- local M = {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
-- }

-- M.opts_extend = { "spec" }

--   -- wk.add {
--   --   mode = { "n", "v" },
--   --   -- { "<leader><tab>", group = "tabs" },
--   --   { "<leader>a", group = "Tab", mode = "n", "v" },
--   --   { "<leader>b", group = "Buffers", mode = "n", "v" },
--   --   { "<leader>d", group = "Debug", mode = "n", "v" },
--   --   { "<leader>f", group = "Find", mode = "n", "v" },
--   --   { "<leader>g", group = "Git", mode = "n", "v" },
--   --   { "<leader>l", group = "LSP", mode = "n", "v" },
--   --   { "<leader>p", group = "Plugins", mode = "n", "v" },
--   --   { "<leader>t", group = "Test", mode = "n", "v" },
--   --   { "<leader>T", group = "Treesitter", mode = "n", "v" },
--   -- }

-- M.opts = {
--   spec = {
--     {
--       mode = { "n", "v" },
--       -- { "<leader><tab>", group = "tabs" },
--       { "<leader>a", group = "Tab" },
--       { "<leader>b", group = "Buffers" },
--       { "<leader>d", group = "Debug" },
--       { "<leader>f", group = "Find" },
--       { "<leader>g", group = "Git" },
--       { "<leader>l", group = "LSP" },
--       { "<leader>p", group = "Plugins" },
--       { "<leader>t", group = "Test" },
--       { "<leader>T", group = "Treesitter" },
--     },
--   },
--   plugins = {
--     marks = false,
--     registers = false,
--     spelling = {
--       enabled = true,
--       suggestions = 20,
--     },
--     presets = {
--       operators = false,
--       motions = false,
--       text_objects = false,
--       windows = false,
--       nav = false,
--       z = false,
--       g = false,
--     },
--   },

--   win = {
--     -- don't allow the popup to overlap with the cursor
--     no_overlap = true,
--     -- width = 1,
--     -- height = { min = 4, max = 25 },
--     -- col = 0,
--     -- row = math.huge,
--     border = "rounded",
--     -- padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
--     -- padding = { 2, 2, 2, 2 }, -- extra window padding [top/bottom, right/left]
--     -- title = true,
--     -- title_pos = "center",
--     -- zindex = 1000,
--     -- Additional vim.wo and vim.bo options
--     -- bo = {},
--     -- wo = {
--     -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
--     -- },
--   },
--   show_help = false,
--   show_keys = false,
--   -- triggers = true, -- automatically setup triggers
--   disable = {
--     buftypes = {},
--     filetypes = { "TelescopePrompt" },
--   },
-- }
-- M.keys = {
--   { "<leader>b", group = "Buffers" },
--   { "<leader>d", group = "Debug" },
--   { "<leader>f", group = "Find" },
--   { "<leader>g", group = "Git" },
--   { "<leader>l", group = "LSP" },
--   { "<leader>p", group = "Plugins" },
--   { "<leader>t", group = "Test" },
--   { "<leader>T", group = "Treesitter" },
--   { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
--   { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
--   { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
--   { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
--   { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
--   { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
--   { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
-- }

-- M.config = function(_, opts)
--   local wk = require "which-key"
--   wk.setup(opts)
-- end

-- return M

-- -- -- old config
-- -- local M = {
-- --   "folke/which-key.nvim",
-- --   -- commit = "eb3ad2eb062392497d0fed3489e2582d4e5bc289"
-- -- }

-- -- function M.config()
-- --   local mappings = {

-- --     q = { "<cmd>confirm q<CR>", "Quit" },
-- --     -- q = { "<cmd>quit | bprevious<CR>", "Quit" },
-- --     h = { "<cmd>nohlsearch<CR>", "NOHL" },
-- --     -- [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
-- --     [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
-- --     v = { "<cmd>vsplit<CR>", "Split" },
-- --     b = {
-- --       name = "Buffers",
-- --       j = { "<cmd>BufferLinePick<cr>", "Jump" },
-- --       f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
-- --       b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
-- --       n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
-- --       W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
-- --       -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
-- --       e = {
-- --         "<cmd>BufferLinePickClose<cr>",
-- --         "Pick which buffer to close",
-- --       },
-- --       h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
-- --       l = {
-- --         "<cmd>BufferLineCloseRight<cr>",
-- --         "Close all to the right",
-- --       },
-- --       D = {
-- --         "<cmd>BufferLineSortByDirectory<cr>",
-- --         "Sort by directory",
-- --       },
-- --       L = {
-- --         "<cmd>BufferLineSortByExtension<cr>",
-- --         "Sort by language",
-- --       },
-- --     },
-- --     d = { name = "Debug" },
-- --     f = { name = "Find" },
-- --     g = { name = "Git" },
-- --     l = { name = "LSP" },
-- --     p = { name = "Plugins" },
-- --     t = { name = "Test" },
-- --     a = {
-- --       name = "Tab",
-- --       n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
-- --       N = { "<cmd>tabnew %<cr>", "New Tab" },
-- --       o = { "<cmd>tabonly<cr>", "Only" },
-- --       h = { "<cmd>-tabmove<cr>", "Move Left" },
-- --       l = { "<cmd>+tabmove<cr>", "Move Right" },
-- --     },
-- --     T = { name = "Treesitter" },
-- --   }

-- --   local which_key = require "which-key"
-- --   which_key.setup {
-- --     plugins = {
-- --       marks = false,
-- --       registers = false,
-- --       spelling = {
-- --         enabled = true,
-- --         suggestions = 20,
-- --       },
-- --       presets = {
-- --         operators = false,
-- --         motions = false,
-- --         text_objects = false,
-- --         windows = false,
-- --         nav = false,
-- --         z = false,
-- --         g = false,
-- --       },
-- --     },
-- --     window = {
-- --       border = "rounded",
-- --       position = "bottom",
-- --       padding = { 2, 2, 2, 2 },
-- --     },
-- --     ignore_missing = true,
-- --     show_help = false,
-- --     show_keys = false,
-- --     disable = {
-- --       buftypes = {},
-- --       filetypes = { "TelescopePrompt" },
-- --     },
-- --   }

-- --   local opts = {
-- --     mode = "n", -- NORMAL mode
-- --     prefix = "<leader>",
-- --   }

-- --   which_key.register(mappings, opts)
-- -- end

-- -- return M
