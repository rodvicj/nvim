-- lua/plugins/bufferline.lua

-- This is a helper function. By defining it as `local` at the top,
-- it's private to this file and keeps the main return table clean.
local function buf_kill(kill_command, bufnr, force)
  kill_command = kill_command or "bd"
  local bo = vim.bo
  local api = vim.api
  local fmt = string.format
  local fn = vim.fn
  if bufnr == 0 or bufnr == nil then
    bufnr = api.nvim_get_current_buf()
  end
  local bufname = api.nvim_buf_get_name(bufnr)
  if not force then
    local choice
    if bo[bufnr].modified then
      choice = fn.confirm(fmt([[Save changes to "%s"?]], bufname), "&Yes\n&No\n&Cancel")
      if choice == 1 then
        vim.api.nvim_buf_call(bufnr, function() vim.cmd("w") end)
      elseif choice == 2 then
        force = true
      else return
      end
    elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
      choice = fn.confirm(fmt([[Close "%s"?]], bufname), "&Yes\n&No\n&Cancel")
      if choice == 1 then
        force = true
      else return
      end
    end
  end
  local windows = vim.tbl_filter(function(win) return api.nvim_win_get_buf(win) == bufnr end, api.nvim_list_wins())
  if force then
    kill_command = kill_command .. "!"
  end
  local buffers = vim.tbl_filter(function(buf) return api.nvim_buf_is_valid(buf) and bo[buf].buflisted end, api.nvim_list_bufs())
  if #buffers > 1 and #windows > 0 then
    for i, v in ipairs(buffers) do
      if v == bufnr then
        local prev_buf_idx = i == 1 and #buffers or (i - 1)
        local prev_buffer = buffers[prev_buf_idx]
        for _, win in ipairs(windows) do
          api.nvim_win_set_buf(win, prev_buffer)
        end
      end
    end
  end
  if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
    vim.cmd(string.format("%s %d", kill_command, bufnr))
  end
end


-- The main plugin specification to be returned
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "echasnovski/mini.icons",

  -- `keys` are defined directly in the plugin spec.
  -- lazy.nvim will automatically handle these.
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },

  -- `opts` are passed to the plugin's setup function.
  opts = {
    highlights = {
      background = { italic = true, bold = false },
      buffer_selected = { italic = false, bold = false },
      numbers = { italic = false, bold = false },
      numbers_selected = { italic = false, bold = false },
    },
    options = {
      mode = "buffers",
      always_show_bufferline = true,
      animation = false,
      auto_hide = false,
      icons = "both",
      icon_custom_colors = true,
      icon_separator_active = "▎",
      icon_separator_inactive = "▎",
      -- Here, we call the local helper function defined above
      close_command = function(bufnr)
        buf_kill("bd", bufnr, false)
      end,
      icon_close_tab = "",
      icon_close_tab_modified = "●",
      offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = false,
      separator_style = "slant",
      numbers = function(opts)
        return string.format("%s", opts.ordinal)
      end,
    },
  },

  -- The `config` function is the ideal place for setup code that
  -- needs to run AFTER the plugin has been loaded.
  config = function(_, opts)
    -- Apply the plugin's options
    require("bufferline").setup(opts)

    -- Configure which-key mappings. This is a side-effect that
    -- should happen during configuration, not during definition.
    local wk = require "which-key"
    wk.add({
      { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", hidden = true },
      { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", hidden = true },
      { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", hidden = true },
      { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", hidden = true },
      { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", hidden = true },
      { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", hidden = true },
      { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", hidden = true },
      { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", hidden = true },
      { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", hidden = true },
      { "<leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", hidden = true },
    })
  end,
}
