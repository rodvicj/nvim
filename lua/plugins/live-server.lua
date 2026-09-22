vim.g.live_server = {
  port = 5555,
  -- browser = false,
}

-- return  {
--   "barrett-ruth/live-server.nvim",
--   event = "VeryLazy",
--   build = "npm install -g live-server",
--   cmd = { "LiveServerStart", "LiveServerStop" },
-- }

return {
  url = "https://forge.barrettruth.com/barrettruth/live-server.nvim",
  name = "live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
}
