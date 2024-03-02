local M = {
  "windwp/nvim-ts-autotag",
}

function M.config()
  require("nvim-ts-autotag").setup {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,

    filetypes = {
      "html",
      "htmldjango",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
  }
end

return M
