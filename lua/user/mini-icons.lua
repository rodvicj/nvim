local M = {
  "echasnovski/mini.icons",
  -- event = "VeryLazy",
}

function M.config()
  require("mini.icons").setup()
  MiniIcons.mock_nvim_web_devicons()
end

return M
