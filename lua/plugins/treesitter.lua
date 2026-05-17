return {
  "nvim-treesitter/nvim-treesitter",
  -- "neovim-treesitter/nvim-treesitter", --not sure if trusted repo yet
  commit = "90cd658",
  main = "nvim-treesitter",
  -- dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup {
      -- require('nvim-treesitter').setup {
      ensure_installed = {
        "html",
        "htmldjango",
        "lua",
        "python",
        "javascript",
        "json",
        "markdown",
      },
      highlight = {
        enable = true,
        disable = { "csv" },
        -- disable = function(lang, buf)
        --   local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats and stats.size > max_filesize then
        --     return true
        --   end
        -- end,
      },
      indent = { enable = true, disable = { "html", "python" } },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = {},

      modules = {},
    }

    -- In Neovim 0.12, treesitter highlight is managed natively
    -- Enable it for all buffers with an available parser
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ok = pcall(vim.treesitter.start, ev.buf)
        if not ok then
          return
        end
      end,
    })

  end,
}
