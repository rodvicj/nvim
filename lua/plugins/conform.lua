return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        -- Web development
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        -- htmldjango = { "djlint", "prettierd" },
        htmldjango = { "djlint" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },

        -- Lua
        lua = { "stylua" },

        -- Python
        -- python = {},

        -- Go
        go = { "gofmt", "goimports" },

        -- Rust
        rust = { "rustfmt" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },

        -- TOML
        toml = { "taplo" },

        -- Use the "*" filetype to run formatters on all filetypes
        -- ["*"] = { "trim_whitespace" },
        -- ["_"] = { "trim_whitespace", lsp_format = "prefer" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      -- format_on_save = {
      -- 	-- These options will be passed to conform.format()
      -- 	timeout_ms = 500,
      -- 	lsp_format = "fallback",
      -- },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" }, -- 2 spaces indentation
        },
        djlint = {
          prepend_args = {
            "--indent=2",
            "--max-blank-lines=0",
            "--blank-line-after-tag=extends",
            "--close-void-tags",
          },
        },
      },
    }

    -- Keybindings
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
        filter = function(client)
          -- This is the custom logic from your second keybinding
          return client.name ~= "typescript-tools"
        end,
      }
    end, { desc = "Format file or range (in visual mode)" })

    -- In your keymaps.lua or init.lua
    -- The single, correct keybinding for formatting
    -- vim.keymap.set({ "n", "v" }, "<leader>lf", function()
    --   -- local conform = require "conform"
    --   conform.format {
    --     lsp_format = "fallback", -- Use LSP only when no other formatter is found
    --     async = false, -- Set to `true` for better performance
    --     timeout_ms = 500,

    --     -- This 'filter' will be passed to vim.lsp.buf.format() when it's used as a fallback
    --     filter = function(client)
    --       -- This is the custom logic from your second keybinding
    --       return client.name ~= "typescript-tools"
    --     end,
    --   }
    -- end, { desc = "Format file or range (fallback to LSP)" })
  end,
}
