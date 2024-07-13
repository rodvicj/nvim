local M = {
  "echasnovski/mini.icons",
  event = "VeryLazy",
}

function M.config()
  -- require "nvim-web-devicons"
  require("mini.icons").setup()
  -- require "mini.icons"
end

return M
