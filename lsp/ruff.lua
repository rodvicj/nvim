return {
  init_options = {
    settings = {
      lint = {
        -- Ignore "I" so you don't get visual error squiggles while typing
        ignore = { "I" },
      },
    },
  },
  -- on_attach = function(client, bufnr)
  on_attach = function(_, bufnr)
    -- Trigger organize imports on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" }, diagnostics = {} },
          apply = true,
        })
      end,
    })
  end,
}
