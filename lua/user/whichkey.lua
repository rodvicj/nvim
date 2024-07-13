local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.opts_extend = { "spec" }

M.opts = {
  plugins = {
    marks = false,
    registers = true,
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
  window = {
    border = "rounded",
    position = "bottom",
    padding = { 2, 2, 2, 2 },
  },
  ignore_missing = true,
  show_help = false,
  show_keys = false,
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },

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
    },
  },
}
M.keys = {

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

-- local M = {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts_extend = { "spec" },
--   opts = {
--     defaults = {},
--     spec = {
--       {
--         mode = { "n", "v" },
--         -- { "<leader><tab>", group = "tabs" },
--         { "<leader>a", group = "Tab" },
--         { "<leader>b", group = "Buffers" },
--         { "<leader>d", group = "Debug" },
--         { "<leader>f", group = "Find" },
--         { "<leader>g", group = "Git" },
--         { "<leader>l", group = "LSP" },
--         { "<leader>p", group = "Plugins" },
--         { "<leader>t", group = "Test" },
--         { "<leader>T", group = "Treesitter" },
--         -- { "<leader>q", group = "quit/session" },
--         -- { "[", group = "prev" },
--         -- { "]", group = "next" },
--         -- { "g", group = "goto" },
--         -- { "gs", group = "surround" },
--         -- { "z", group = "fold" },
--       },
--     },
--   },
--   keys = {

--     { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
--     { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
--     { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
--     { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
--     { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
--     { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
--     { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
--   },
--   config = function(_, opts)
--     local wk = require "which-key"
--     wk.setup(opts)
--   end,
-- }

-- return M



-- -- old config
-- local M = {
--   "folke/which-key.nvim",
-- }

-- function M.config()
--   local mappings = {
--     ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "BufferLineGoToBuffer 1" },
--     ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "BufferLineGoToBuffer 2" },
--     ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "BufferLineGoToBuffer 3" },
--     ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "BufferLineGoToBuffer 4" },
--     ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "BufferLineGoToBuffer 5" },
--     ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "BufferLineGoToBuffer 6" },
--     ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "BufferLineGoToBuffer 7" },
--     ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "BufferLineGoToBuffer 8" },
--     ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "BufferLineGoToBuffer 9" },
--     ["0"] = { "<cmd>BufferLineGoToBuffer -1<cr>", "BufferLineGoToBuffer 10" },
--     ["z"] = { "<cmd>ZenMode<cr>", "Zen mode" },
--     ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
--     ["w"] = { "<cmd>w!<CR>", "Save" },

--     -- ["gd"] = { vim.lsp.buf.definition, "Goto Definition" },
--     -- ["gD"] = { vim.lsp.buf.declaration, "Goto Declaration" },
--     -- ["gr"] = { vim.lsp.buf.references, "Goto references" },

--     -- ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
--     -- ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
--     -- ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
--     -- ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
--     -- ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
--     -- ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },

--     q = { "<cmd>confirm q<CR>", "Quit" },
--     -- q = { "<cmd>quit | bprevious<CR>", "Quit" },
--     h = { "<cmd>nohlsearch<CR>", "NOHL" },
--     -- [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
--     [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
--     v = { "<cmd>vsplit<CR>", "Split" },
--     b = {
--       name = "Buffers",
--       j = { "<cmd>BufferLinePick<cr>", "Jump" },
--       f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
--       b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
--       n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
--       W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
--       -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
--       e = {
--         "<cmd>BufferLinePickClose<cr>",
--         "Pick which buffer to close",
--       },
--       h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
--       l = {
--         "<cmd>BufferLineCloseRight<cr>",
--         "Close all to the right",
--       },
--       D = {
--         "<cmd>BufferLineSortByDirectory<cr>",
--         "Sort by directory",
--       },
--       L = {
--         "<cmd>BufferLineSortByExtension<cr>",
--         "Sort by language",
--       },
--     },
--     d = { name = "Debug" },
--     f = { name = "Find" },
--     g = { name = "Git" },
--     l = { name = "LSP" },
--     p = { name = "Plugins" },
--     t = { name = "Test" },
--     a = {
--       name = "Tab",
--       n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
--       N = { "<cmd>tabnew %<cr>", "New Tab" },
--       o = { "<cmd>tabonly<cr>", "Only" },
--       h = { "<cmd>-tabmove<cr>", "Move Left" },
--       l = { "<cmd>+tabmove<cr>", "Move Right" },
--     },
--     T = { name = "Treesitter" },
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
