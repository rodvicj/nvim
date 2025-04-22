local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  -- local diagnostics = null_ls.builtins.diagnostics

  -- Define your line count limit
  local MAX_LINES = 1000000 -- Set your desired limit here

  -- Helper function to check if the buffer is too large
  local function is_buffer_small_enough(params)
    if not params or type(params.bufnr) ~= "number" or params.bufnr <= 0 then
      -- If the buffer context isn't valid, it's safer to assume we should
      -- disable the source for this check. You could also return true
      -- if you prefer the opposite default behavior, but false is usually safer.
      -- You can uncomment the next line for debugging if the issue persists
      -- print("Warning: is_buffer_small_enough called with invalid params or bufnr:", vim.inspect(params))
      return false
    end

    -- params.bufnr contains the buffer number
    local line_count = vim.api.nvim_buf_line_count(params.bufnr)
    -- You could also check file size:
    -- local file_path = vim.api.nvim_buf_get_name(params.bufnr)
    -- local file_size = vim.fn.getfsize(file_path) -- in bytes
    -- if file_size > MAX_BYTES then return false end

    -- Return true ONLY if the line count is within the limit
    return line_count <= MAX_LINES
  end

  null_ls.setup {
    debug = false,
    sources = {

      require "none-ls.diagnostics.flake8",
      -- require("none-ls.diagnostics.flake8").with {
      --   extra_args = { "--ignore=E501,E203,F821,F401,W504,E303,W292" },
      -- },
      formatting.stylua,
      formatting.prettier,
      -- formatting.prettier.with {
      --   -- extra_filetypes = { "toml" },
      --   filetypes = { "javascript", "html" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      formatting.yapf,
      -- -- use black when you have to change single quotes to double quotes in python
      -- formatting.black,

      -- for htmldjango
      formatting.djlint.with {
        -- extra_filetypes = { "html", "htmldjango" },
        extra_args = { "--indent=2", "--max-blank-lines=1", "--blank-line-after-tag=extends", "--close-void-tags" },
      },
      -- null_ls.builtins.completion.spell,
      null_ls.builtins.completion.spell.with {
        condition = is_buffer_small_enough,
        -- You can add other specific options for spell completion here if needed.
        -- For example, you might want to limit it to certain filetypes anyway:
        -- filetypes = { "markdown", "text", "gitcommit" },
      },
    },
  }
end

return M
