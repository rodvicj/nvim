local M = {
  "echasnovski/mini.icons",
  priority = 60, -- make sure to load this before all the other start plugins
}

function M.config()
  require("mini.icons").setup()
  MiniIcons.mock_nvim_web_devicons()
end

return M
