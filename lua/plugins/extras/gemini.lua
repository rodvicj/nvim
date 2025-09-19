local M = {
  "kiddos/gemini.nvim",
  event = "VeryLazy",
}

function M.config()
  local api = require "gemini.api"
  require("gemini").setup {
    model_config = {
      completion_delay = 1000,
      model_id = api.GEMINI_2_5_PRO_PREVIEW,
      temperature = 0.01,
      top_k = 1.0,
      max_output_tokens = 8196,
      response_mime_type = "text/plain",
    },
    hints = {
      enabled = true,
      hints_delay = 2000,
      insert_result_key = "<CR>",
    },
    completion = {
      enabled = true,
      insert_result_key = "<CR>",
    },
  }
end

return M
