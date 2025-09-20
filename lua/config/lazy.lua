local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  install = {
    colorscheme = { "tokyonight-storm", "default" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- -- lua/config/lazy.lua (or wherever you call lazy.setup)

-- -- Bootstrap lazy.nvim
-- local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system {
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   }
-- end
-- vim.opt.rtp:prepend(lazypath)

-- -- Setup lazy.nvim with the new structure
-- require("lazy").setup({
--   -- The single most important line:
--   -- lazy.nvim will automatically find and load all .lua files
--   -- in the `lua/plugins/` directory.
--   { import = "plugins" },
-- }, {
--   -- Optional: lazy.nvim configuration options
--   ui = {
--     border = "rounded",
--   },
--   checker = {
--     enabled = true,
--     notify = false,
--   },
--   change_detection = {
--     notify = false,
--   },
-- })
