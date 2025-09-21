local M = {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}

function M.config()
  require("typescript-tools").setup {
    settings = {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      expose_as_code_action = "all",
      -- tsserver_plugins = {},
      tsserver_max_memory = "auto",
      -- complete_function_calls = true,
      include_completions_with_insert_text = true,
      -- code_lens = "all",
      -- disable_member_code_lens = true,

      -- described below
      -- tsserver_format_options = {},

      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,

        includeCompletionsForModuleExports = true,
        quotePreference = "auto",

        -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
      },

      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  }
end

return M
