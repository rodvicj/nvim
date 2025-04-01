local M = {
  "rodvicj/gemini.nvim",
  event = "VeryLazy",
}

function M.config()
  require("gemini").setup()
end

return M
