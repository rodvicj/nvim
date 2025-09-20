-- local M = {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   ft = { "markdown" },
--   build = function() vim.fn["mkdp#util#install"]() end,
-- }



-- -- this resolves
-- -- ERROR: Vim:E117: Unknown function: mkdp#util#install when install by lazy.nvim #690
-- -- https://github.com/iamcco/markdown-preview.nvim/issues/690
local M = {
  -- Install markdown preview, use npx if available.
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function(plugin)
    if vim.fn.executable "npx" then
      vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end
  end,
  init = function()
    if vim.fn.executable "npx" then
      vim.g.mkdp_filetypes = { "markdown" }
    end
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
