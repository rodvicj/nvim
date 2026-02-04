-- local M = {
--   "barrett-ruth/live-server.nvim",
--   event = "VeryLazy",
--   build = "npm install -g live-server",
--   cmd = { "LiveServerStart", "LiveServerStop" },
-- }

-- return M



--live server
vim.g.live_server = {
  args = { "--port=5555" },
}

return  {
  "barrett-ruth/live-server.nvim",
  event = "VeryLazy",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
}
