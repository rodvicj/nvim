require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
require "user.commands"

spec "user.colorscheme"
spec "user.mini-icons"
spec "user.treesitter"
spec "user.mason"
spec "user.mason-tool-installer"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.telescope"
spec "user.illuminate"
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.comment"
spec "user.lualine"
spec "user.navic"
spec "user.breadcrumbs"
spec "user.harpoon"
spec "user.neotest"
spec "user.autopairs"
spec "user.neogit"
spec "user.alpha"
spec "user.project"
spec "user.indentline"
spec "user.toggleterm"
spec "user.bufferline"
spec "user.autotag"
spec "user.cmp"
spec "user.none-ls"

-- Extras
spec "user.extras.fidget"
spec "user.extras.neoscroll"
spec "user.extras.rainbow-delimiters"
spec "user.extras.todo-comments"
spec "user.extras.typescript-tools"
spec "user.extras.live-server"
spec "user.extras.dadbod-ui"
spec "user.extras.markdown-preview"
spec "user.extras.oil"
spec "user.extras.zen"
spec "user.extras.colorizer"
spec "user.extras.scrollbar"
spec "user.extras.marks"
spec "user.extras.ufo"
-- spec "user.extras.hipatterns" -- cause stuttering in large files
-- spec "user.extras.copilot"
-- spec "user.extras.faster"
-- spec "user.extras.gemini"

require "user.lazy"
-- pg_ctl -D /var/lib/postgres/data -l logfile start


-- -- Localize globals for slightly better performance and clarity

-- local vim = vim
-- local pcall = pcall
-- local table = table
-- local string = string

-- -- A set of clients to always ignore
-- local clients_to_ignore = {
--   copilot = true,
--   ["null-ls"] = true,
-- }

-- ---Gets the names of active LSP clients for the current buffer.
-- ---@param names_set table A set (table with keys as names) to add client names to.
-- local function add_lsp_clients(names_set)
--   local lsp_clients = vim.lsp.get_clients { bufnr = 0 }
--   for _, client in ipairs(lsp_clients) do
--     if not clients_to_ignore[client.name] then
--       names_set[client.name] = true
--     end
--   end
-- end

-- ---Gets the names of active null-ls sources for the current buffer's filetype.
-- ---@param names_set table A set to add source names to.
-- ---@param ft string The filetype of the current buffer.
-- local function add_null_ls_sources(names_set, ft)
--   local ok, null_ls = pcall(require, "null-ls")
--   if not ok then
--     return
--   end

--   for _, source in ipairs(null_ls.get_sources()) do
--     -- source._validated is an internal field but commonly used for this check.
--     -- It ensures the source is properly configured and its dependencies are met.
--     if source._validated and source.filetypes[ft] then
--       names_set[source.name] = true
--     end
--   end
-- end

-- ---Gets the names of active nvim-lint linters for the current buffer's filetype.
-- ---@param names_set table A set to add linter names to.
-- ---@param ft string The filetype of the current buffer.
-- local function add_linters(names_set, ft)
--   local ok, lint = pcall(require, "lint")
--   if not ok then
--     return
--   end

--   -- Directly access the linters for the current filetype instead of iterating all.
--   local linters_for_ft = lint.linters_by_ft[ft]
--   if not linters_for_ft then
--     return
--   end

--   if type(linters_for_ft) == "string" then
--     names_set[linters_for_ft] = true
--   elseif type(linters_for_ft) == "table" then
--     for _, linter_name in ipairs(linters_for_ft) do
--       names_set[linter_name] = true
--     end
--   end
-- end

-- ---Gets the names of available formatters from formatter.nvim for the current buffer's filetype.
-- ---@param names_set table A set to add formatter names to.
-- ---@param ft string The filetype of the current buffer.
-- local function add_formatters(names_set, ft)
--   local ok, formatter = pcall(require, "formatter")
--   if not ok then
--     return
--   end

--   local util = require "formatter.util"
--   for _, formatter_name in ipairs(util.get_available_formatters_for_ft(ft)) do
--     names_set[formatter_name] = true
--   end
-- end

-- ---Gathers all active LSP clients, linters, and formatters for the current buffer.
-- function M.get_attached_clients()
--   local client_names_set = {}
--   local buf_ft = vim.bo.filetype

--   add_lsp_clients(client_names_set)
--   add_null_ls_sources(client_names_set, buf_ft)
--   add_linters(client_names_set, buf_ft)
--   add_formatters(client_names_set, buf_ft)

--   -- Convert the set (keys of the table) to a list of names.
--   local unique_names = {}
--   for name, _ in pairs(client_names_set) do
--     table.insert(unique_names, name)
--   end

--   if #unique_names == 0 then
--     return "LSP Inactive"
--   end

--   -- Sorting provides a consistent, predictable order.
--   table.sort(unique_names)

--   return string.format("[%s]", table.concat(unique_names, ", "))
-- end

-- ---Gets the git diff status from gitsigns for the current buffer.
-- function M.diff_source()
--   local gitsigns = vim.b.gitsigns_status_dict
--   -- Provide a default table to ensure the function always returns a valid table.
--   -- This prevents errors in the code that calls this function.
--   if not gitsigns then
--     return { added = 0, modified = 0, removed = 0 }
--   end

--   return {
--     added = gitsigns.added or 0,
--     modified = gitsigns.changed or 0,
--     removed = gitsigns.removed or 0,
--   }
-- end
