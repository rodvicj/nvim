local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}

function M.config()
  -- markdown preview options
  vim.g.mkdp_filetypes = { "markdown" }
  vim.g.mkdp_theme = { "dark" }

  -- auto close when changing markdown buffer to other buffechanging markdown buffer to other buffer
  vim.g.mkdp_auto_close = 0
end

return M
