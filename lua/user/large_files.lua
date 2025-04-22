-- -- lua/config/large_files.lua

-- local M = {}

-- -- Define your threshold (e.g., lines or size in bytes)
-- -- Using line count here
-- M.large_file_lines = 100000 -- Adjust this threshold as needed (e.g., 50000, 100000, etc.)
-- -- Or use file size (less common for editor perf, but possible)
-- -- M.large_file_bytes = 10 * 1024 * 1024 -- 10MB

-- -- Helper function to check if a buffer is considered large
-- M.is_large_file = function(bufnr)
--   bufnr = bufnr or vim.api.nvim_get_current_buf()
--   -- Check line count
--   local line_count = vim.api.nvim_buf_line_count(bufnr)
--   if line_count > M.large_file_lines then
--     -- print("Detected large file (lines): " .. line_count)
--     return true
--   end

--   -- -- Optional: Check file size (requires buffer to have a name)
--   -- local fname = vim.api.nvim_buf_get_name(bufnr)
--   -- if fname and fname ~= "" then
--   --   local ok, stat = pcall(vim.loop.fs_stat, fname)
--   --   if ok and stat and stat.size > M.large_file_bytes then
--   --       -- print("Detected large file (bytes): " .. stat.size)
--   --       return true
--   --   end
--   -- end

--   return false
-- end

-- -- Function to apply settings for large files
-- M.setup_large_file_opts = function(bufnr)
--   bufnr = bufnr or vim.api.nvim_get_current_buf()
--   if M.is_large_file(bufnr) then
--     vim.notify("Large file detected (" .. vim.api.nvim_buf_line_count(bufnr) .. " lines). Disabling some features.", vim.log.levels.INFO)

--     -- Disable syntax highlighting (most impactful)
--     vim.bo[bufnr].syntax = "off"
--     -- Or, try to disable treesitter highlighting/indent specifically if you still want basic syntax
--     -- vim.cmd('TSBufDisable highlight')
--     -- vim.cmd('TSBufDisable indent')

--     -- Disable LSP for this buffer
--     -- We achieve this by setting a buffer variable that the LspAttach hook will check
--     vim.b[bufnr].disable_lsp = true
--     -- Force detachment if already attached (might be needed depending on timing)
--     -- pcall(vim.lsp.buf_detach_client, bufnr, client.id) -- Needs client id, tricky here

--     -- Disable linters/formatters (often tied to LSP or separate autocmds)
--     -- Set buffer variables to signal linters/formatters not to run
--     vim.b[bufnr].disable_linting = true
--     vim.b[bufnr].disable_formatting = true
--     -- You might need to configure conform.nvim / nvim-lint specifically to respect these flags

--     -- Disable GitSigns
--     -- Set a buffer variable that gitsigns config can check
--     vim.b[bufnr].disable_gitsigns = true
--     -- Or attempt to detach gitsigns if it has an API for it (check gitsigns docs)
--     -- pcall(require('gitsigns').detach, bufnr) -- If such a function exists

--     -- Disable indent lines (can cause redraw lag)
--     -- Assuming indent-blankline.nvim is used by LazyVim
--     if package.loaded['indent_blankline'] then
--       vim.b[bufnr].indent_blankline_enabled = false -- Check indent-blankline docs for correct way
--       -- Or try disabling its buffer scope directly if possible
--       -- vim.cmd('IBLDisable') -- Example, check actual command
--     end

--     -- Make undo history potentially less memory intensive (optional)
--     vim.bo[bufnr].undolevels = 100 -- Default is 1000
--     vim.bo[bufnr].undofile = false

--     -- Other potential Neovim options
--     vim.bo[bufnr].swapfile = false -- Avoid I/O for swap
--     vim.opt_local.foldmethod = "manual" -- Avoid complex folding
--     vim.opt_local.foldenable = false
--     vim.opt_local.spell = false

--     -- Increase update time (less frequent CursorHold triggers)
--     vim.opt_local.updatetime = 2000 -- Default 300ms -> 2s

--     print("Applied large file optimizations for buffer " .. bufnr)
--   end
-- end

-- -- Autocommand to trigger the setup on buffer load
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
--   group = vim.api.nvim_create_augroup("LargeFileSettings", { clear = true }),
--   pattern = "*", -- Check all files initially
--   callback = function(args)
--     -- Need a small delay sometimes for buffer info to be fully available
--     -- Or ensure BufReadPost is sufficient
--     -- print("Autocmd Triggered for buf: " .. args.buf)
--     M.setup_large_file_opts(args.buf)
--   end,
-- })

-- print("Large file detection setup loaded.")

-- return M
