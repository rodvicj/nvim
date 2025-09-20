local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
}

function M.config()
  local builtin = require "statuscol.builtin"
  local cfg = {
    setopt = true,
    relculright = true,
    segments = {
      { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
      { text = { "%s" }, click = "v:lua.ScSa" },
      { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    },
    ft_ignore = { "NvimTree" }, -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
  }

  require("statuscol").setup(cfg)

  vim.o.foldcolumn = "1" -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰡏 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end

  local ftMap = { -- typescriptreact = { "lsp", "treesitter" },
    -- python = { "indent" },
    yaml = "",
    ["neo-tree"] = "",
    -- ["NvimTree"] = "",
  }

  require("ufo").setup {
    fold_virt_text_handler = handler,
    close_fold_kinds = {},
    -- close_fold_kinds = { "imports", "comment" },
    provider_selector = function(bufnr, filetype, buftype)
      -- if you prefer treesitter provider rather than lsp,
      -- return ftMap[filetype] or {'treesitter', 'indent'}
      return ftMap[filetype]
      -- return { "treesitter", "indent" }

      -- refer to ./doc/example.lua for detail
    end,

    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-k>",
        scrollD = "<C-j>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  }

  local wk = require "which-key"
  wk.add {
    {
      "za",
      desc = "Toggle fold",
    },
    {
      "zm",
      "<cmd>lua require('ufo').closeAllFolds()<cr>",
      desc = "Close all folds",
    },
    {
      "zr",
      "<cmd>lua require('ufo').openAllFolds()<cr>",
      desc = "Open all folds",
    },
  }

  vim.keymap.set("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      -- vim.lsp.buf.hover()
      vim.lsp.buf.hover {
        border = "rounded",
      }
    end
  end)

  -- vim.keymap.set("n", "K", function()
  --   local winid = require("ufo").peekFoldedLinesUnderCursor()
  --   if not winid then
  --     vim.lsp.buf.hover {
  --       border = "rounded",
  --     }
  --   end
  -- end, opts)
end

return M
