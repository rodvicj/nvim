local M = {
  "lukas-reineke/indent-blankline.nvim",
}

function M.config()
  local icons = require "user.icons"

  require("ibl").setup {
    indent = {
      char = icons.ui.LineLeft,
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      injected_languages = true,
      show_exact_scope = false,
      include = {
        node_type = {
          ["typescript"] = {
            "unary_expression",
            "expression_statement",
            "return_statement",
            "open_tag",
            "key",
            "array",
            "object",
            "lexical_declaration",
            "switch_statement",
            "switch_case",
            "switch_body",
            "switch_default",
          },

          ["tsx"] = {
            "unary_expression",
            "jsx_expression",
            "jsx_self_closing_element",
            "expression_statement",
            "return_statement",
            "open_tag",
            "key",
            "array",
            "object",
            "lexical_declaration",
            "switch_statement",
            "switch_case",
            "switch_body",
            "switch_default",
          },
          ["rust"] = { "let_declaration", "const_declaration" },
        },
      },
    },
    exclude = {
      filetypes = {
        "help",
        "lazy",
        "neo-tree",
        "notify",
        "text",
        "startify",
        "dashboard",
        "neogitstatus",
        "NvimTree",
        "Trouble",
      },
      buftypes = { "terminal", "nofile" },
    },
  }
end

return M

-- local M = {
--   "lukas-reineke/indent-blankline.nvim",
--   event = "VeryLazy",
--   commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
-- }

-- function M.config()
-- local icons = require "user.icons"

--   require("indent_blankline").setup {
--     buftype_exclude = { "terminal", "nofile" },
--     filetype_exclude = {
--       "help",
--       "startify",
--       "dashboard",
--       "lazy",
--       "neogitstatus",
--       "NvimTree",
--       "Trouble",
--       "text",
--     },
--     char = icons.ui.LineLeft,
--     -- char = icons.ui.LineMiddle,
--     context_char = icons.ui.LineLeft,
--     -- context_char = icons.ui.LineMiddle,
--     show_trailing_blankline_indent = false,
--     show_first_indent_level = true,
--     use_treesitter = true,
--     show_current_context = true,
--   }
-- end

-- return M
