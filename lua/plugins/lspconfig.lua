local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

-- Enable LSP servers
vim.lsp.enable {
  "lua_ls",
  "cssls",
  "html",
  -- "pyright",
  "basedpyright",
  "bashls",
  "jsonls",
  "yamlls",
  "astro",
  "clangd",
  "rust_analyzer",
  "eslint",
  "gopls",
  "tailwindcss",
  "arduino_language_server",
  "clangd",
  "ruff",
  -- "ts_ls",
}

-- Configure diagnostic display with custom signs
vim.diagnostic.config {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = true, -- Show source in diagnostic popup window
    header = "",
    prefix = "",
  },
  virtual_text = false,
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

-- -- Enable inlay hints
-- vim.lsp.inlay_hint.enable(true)

-- Create default capabilities without cmp
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
  capabilities = lsp_capabilities,
})

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Show LSP references"
    keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

    opts.desc = "Show LSP implementations"

    -- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    -- keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
    -- keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap.set("n", "gI", "<cmd>lua vim.lsp.implementation()<cr>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

    -- opts.desc = "See available code actions"
    -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

    -- opts.desc = "Show buffer diagnostics"
    -- keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts)

    opts.desc = "Show line diagnostics"

    --   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    keymap.set("n", "gl", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "<leader>dk", function()
      vim.diagnostic.jump { count = -1, float = true }
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "<leader>dj", function()
      vim.diagnostic.jump { count = 1, float = true }
    end, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", function()
      vim.lsp.buf.hover { border = "single" }
    end, opts)

    opts.desc = "Toggle inlay hints locally"
    keymap.set("n", "<leader>lh", function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
    end, opts)

    opts.desc = "Toggle inlay hints globally"
    keymap.set("n", "<leader>lH", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", opts)

    opts.desc = "Format"
    -- keymap.set(
    --   "n",
    --   "<leader>lf",
    --   "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<CR>",
    --   opts
    -- )

    --     { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    --     {
    --       "<leader>lf",
    --       "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    --       desc = "Format",
    --     },
    --     { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    --     { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    --     { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
    --     { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    --     { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    --     { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    --     {
    --       "<leader>la",
    --       "<cmd>lua vim.lsp.buf.code_action()<cr>",
    --       desc = "Code Action",
    --       mode = "v",
  end,
})

return M

-- local M = {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     {
--       "folke/neodev.nvim",
--     },
--   },
-- }

-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   local keymap = vim.api.nvim_buf_set_keymap
--   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
--   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
--   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
--   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
--   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
--   keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- end

-- M.on_attach = function(client, bufnr)
--   lsp_keymaps(bufnr)
-- end

-- function M.common_capabilities()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true

--   return capabilities
-- end

-- M.toggle_inlay_hints = function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
-- end

-- function M.config()
--   local wk = require "which-key"
--   wk.add {
--     { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
--     {
--       "<leader>lf",
--       "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
--       desc = "Format",
--     },
--     { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
--     { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
--     { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
--     { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
--     { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
--     { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
--     { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
--     {
--       "<leader>la",
--       "<cmd>lua vim.lsp.buf.code_action()<cr>",
--       desc = "Code Action",
--       mode = "v",
--     },
--     -- {
--     --   "<leader>lf",
--     --   "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return (client.name ~= 'html' and client.name ~= 'typescript-tools') end})<cr>",
--     --   desc = "Format",
--     -- },
--   }

--   local lspconfig = require "lspconfig"
--   local icons = require "user.icons"

--   local servers = {
--     "lua_ls",
--     "cssls",
--     "html",
--     "pyright",
--     -- "basedpyright",
--     "bashls",
--     "jsonls",
--     "yamlls",
--     "astro",
--     "clangd",
--     "rust_analyzer",
--     "eslint",
--     "gopls",
--     "tailwindcss",
--     "arduino_language_server",
--     "clangd",
--     "ruff",
--     -- "ts_ls",
--   }

--   -- Configure diagnostic display with custom signs
--   vim.diagnostic.config {
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = true, -- Show source in diagnostic popup window
--       header = "",
--       prefix = "",
--     },
--     virtual_text = false,
--     virtual_lines = false,
--     signs = {
--       text = {
--         [vim.diagnostic.severity.ERROR] = " ",
--         [vim.diagnostic.severity.WARN] = " ",
--         [vim.diagnostic.severity.HINT] = " ",
--         [vim.diagnostic.severity.INFO] = " ",
--       },
--     },
--     underline = true,
--     update_in_insert = false,
--     severity_sort = true,
--   }

--   require("lspconfig.ui.windows").default_options.border = "rounded"

--   for _, server in pairs(servers) do
--     local opts = {
--       on_attach = M.on_attach,
--       capabilities = M.common_capabilities(),
--     }

--     local require_ok, settings = pcall(require, "user.lspsettings." .. server)
--     if require_ok then
--       opts = vim.tbl_deep_extend("force", settings, opts)
--     end

--     if server == "lua_ls" then
--       require("neodev").setup {}
--     end

--     if server == "arduino_language_server" then
--       opts.cmd = {
--         "arduino-language-server",
--         "-cli-config",
--         "~/.arduino15/arduino-cli.yaml",
--         "-cli",
--         "arduino-cli",
--         "-clangd",
--         "clangd",
--         "-fqbn",
--         "arduino:avr:uno",
--       }
--       opts.filetypes = { "ino", "pde", "arduino" }
--     end

--     lspconfig[server].setup(opts)
--   end
-- end

-- return M
