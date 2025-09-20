local M = {
  "barrett-ruth/live-server.nvim",
  event = "VeryLazy",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
}

function M.config()
  require("live-server").setup()
end

return M
