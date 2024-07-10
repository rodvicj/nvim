local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  require("mini.hipatterns").setup()
end

return M
