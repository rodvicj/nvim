local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
        commit = "7278f9d9aeee0e2befcb8a5b1a25c65bd54396aa",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
  },
  event = "InsertEnter",
}

function M.config()
  require("tailwindcss-colorizer-cmp").setup {
    color_square_width = 1,
  }
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("typescriptreact", { "html" })
  require("luasnip").filetype_extend("javascriptreact", { "html" })
  require("luasnip").filetype_extend("htmldjango", { "html" })

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local icons = require "user.icons"

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
          -- require("neotab").tabout()
        else
          fallback()
          -- require("neotab").tabout()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      expandable_indicator = true,
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "lsp",
          nvim_lua = "nvim_lua",
          luasnip = "luasnip",
          buffer = "buffer",
          path = "path",
          emoji = "emoji",
        })[entry.source.name]

        if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
          local duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          }

          local duplicates_default = 0

          vim_item.dup = duplicates[entry.source.name] or duplicates_default
        end

        if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
          local words = {}
          for word in string.gmatch(vim_item.word, "[^-]+") do
            table.insert(words, word)
          end

          local color_name, color_number
          if
            words[2] == "x"
            or words[2] == "y"
            or words[2] == "t"
            or words[2] == "b"
            or words[2] == "l"
            or words[2] == "r"
          then
            color_name = words[3]
            color_number = words[4]
          else
            color_name = words[2]
            color_number = words[3]
          end

          if color_name == "white" or color_name == "black" then
            local color
            if color_name == "white" then
              color = "ffffff"
            else
              color = "000000"
            end

            local hl_group = "lsp_documentColor_mf_" .. color
            -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
            vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
            vim_item.kind_hl_group = hl_group

            -- make the color square 2 chars wide
            vim_item.kind = string.rep("▣", 1)

            return vim_item
          elseif #words < 3 or #words > 4 then
            -- doesn't look like this is a tailwind css color
            return vim_item
          end

          if not color_name or not color_number then
            return vim_item
          end

          local color_index = tonumber(color_number)
          local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

          if not tailwindcss_colors[color_name] then
            return vim_item
          end

          if not tailwindcss_colors[color_name][color_index] then
            return vim_item
          end

          local color = tailwindcss_colors[color_name][color_index]

          local hl_group = "lsp_documentColor_mf_" .. color
          -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
          vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })

          vim_item.kind_hl_group = hl_group

          -- make the color square 2 chars wide
          vim_item.kind = string.rep("▣", 1)

          return vim_item
        end

        if entry.source.name == "copilot" then
          vim_item.kind = icons.git.Octoface
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end

        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        if entry.source.name == "crates" then
          vim_item.kind = icons.misc.Package
          vim_item.kind_hl_group = "CmpItemKindCrate"
        end

        if entry.source.name == "lab.quick_data" then
          vim_item.kind = icons.misc.CircuitBoard
          vim_item.kind_hl_group = "CmpItemKindConstant"
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        return vim_item
      end,
    },
    -- -- old format setup
    -- format = function(entry, vim_item)
    --   vim_item.kind = icons.kind[vim_item.kind]
    --   vim_item.menu = ({
    --     nvim_lsp = "lsp",
    --     nvim_lua = "nvim_lua",
    --     luasnip = "luasnip",
    --     buffer = "buffer",
    --     path = "path",
    --     emoji = "emoji",
    --   })[entry.source.name]

    --   if entry.source.name == "emoji" then
    --     vim_item.kind = icons.misc.Smiley
    --     vim_item.kind_hl_group = "CmpItemKindEmoji"
    --   end

    --   if entry.source.name == "cmp_tabnine" then
    --     vim_item.kind = icons.misc.Robot
    --     vim_item.kind_hl_group = "CmpItemKindTabnine"
    --   end

    --   return vim_item
    -- end,
    -- },
    sources = {
      -- { name = "copilot" },
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]

          if kind == "Text" then
            return false
          end

          return true
        end,
      },
      -- { name = "luasnip" },
      {
        name = "buffer",
        priority = 9,
        option = {
          indexing_interval = 1000,
          max_indexed_line_length = 512,
          get_bufnrs = function()
            local bufs = vim.api.nvim_list_bufs()

            local result = {}
            for _, v in ipairs(bufs) do
              local byte_size = vim.api.nvim_buf_get_offset(v, vim.api.nvim_buf_line_count(v))
              if byte_size < 1024 * 1024 then
                result[#result + 1] = v
              end
            end

            return result
          end,
        },
      },
      { name = "cmp_tabnine" },
      -- { name = "nvim_lua" },
      -- { name = "path" },
      -- { name = "calc" },
      -- { name = "emoji" },
    },

    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = "rounded",
        scrollbar = false,
      },
      documentation = {
        border = "rounded",
      },
    },
    experimental = {
      ghost_text = false,
    },
  }

  -- Setup up vim-dadbod
  cmp.setup.filetype({ "sql" }, {
    sources = {
      { name = "vim-dadbod-completion" },
      { name = "buffer" },
    },
  })

  -- NOTE: only use lsp auto-complete in css to avoid polluted auto-completion provided by cmp;
  cmp.setup.filetype({ "css", "scss" }, {
    sources = {
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]

          if kind == "Text" then
            return false
          end

          return true
        end,
      },
      -- { name = "luasnip" },
      -- { name = "cmp_tabnine" },
      -- { name = "nvim_lua" },
      -- { name = "buffer" },
      -- { name = "path" },
      -- { name = "calc" },
      -- { name = "emoji" },
    },
  })
end

return M
