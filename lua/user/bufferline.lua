local M = {}

M.highlights = {
  background = {
    italic = true,
    bold = false,
  },
  buffer_selected = {
    italic = false,
    bold = false,
  },
  numbers = {
    italic = false,
    bold = false,
  },
  numbers_selected = {
    italic = false,
    bold = false,
  },
}

M.options = {
  mode = "buffers",
  always_show_bufferline = true,
  animation = false,
  auto_hide = false,
  icons = "both",
  icon_custom_colors = true,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  close_command = function(bufnr) -- can be a string | function, see "Mouse actions"
    M.buf_kill("bd", bufnr, false)
  end,
  icon_close_tab = "",
  icon_close_tab_modified = "●",
  offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
  show_buffer_icons = true,
  show_buffer_close_icons = true,
  show_close_icon = false,
  show_tab_indicators = false,
  separator_style = "slant",
  -- enforce_regular_tabs = true,
  numbers = function(opts)
    return string.format("%s", opts.ordinal)
    -- return string.format("%s", opts.raise(opts.ordinal))
  end,
}

M = {
  "akinsho/bufferline.nvim",
  opts = {
    options = M.options,
    highlights = M.highlights,
  },
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}


--stylua: ignore

-- Common kill function for bdelete and bwipeout
-- credits: based on bbye and nvim-bufdel
---@param kill_command? string defaults to "bd"
---@param bufnr? number defaults to the current buffer
---@param force? boolean defaults to false
function M.buf_kill(kill_command, bufnr, force)
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
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("w")
        end)
      elseif choice == 2 then
        force = true
      else return
      end
    elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
      choice = fn.confirm(fmt([[Close "%s"?]], bufname), "&Yes\n&No\n&Cancel")
      if choice == 1 then
        force = true
      else
        return
      end
    end
  end

  -- Get list of windows IDs with the buffer to close
  local windows = vim.tbl_filter(function(win)
    return api.nvim_win_get_buf(win) == bufnr
  end, api.nvim_list_wins())

  if force then
    kill_command = kill_command .. "!"
  end

  -- Get list of active buffers
  local buffers = vim.tbl_filter(function(buf)
    return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
  end, api.nvim_list_bufs())

  -- If there is only one buffer (which has to be the current one), vim will
  -- create a new buffer on :bd.
  -- For more than one buffer, pick the previous buffer (wrapping around if necessary)
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

  -- Check if buffer still exists, to ensure the target buffer wasn't killed
  -- due to options like bufhidden=wipe.
  if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
    vim.cmd(string.format("%s %d", kill_command, bufnr))
  end
end

vim.opt.termguicolors = true

return M
