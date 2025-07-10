local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
-- 	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
-- end
-- vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

function M.config()
  require("toggleterm").setup {
    size = 20,
    -- open_mapping = [[<c-\>]],
    -- open_mapping = [[<c-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = false,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_win_open'
      -- see :h nvim_win_open for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      border = "curved",
      -- width = <value>,
      -- height = <value>,
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    -- Add executables on the config.lua
    -- { exec, keymap, name}
    -- lvim.builtin.terminal.execs = {{}} to overwrite
    -- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
    -- TODO: pls add mappings in which key and refactor this
    execs = {
      -- { "lazygit", "<leader>gg", "LazyGit", "float" },
    },
  }

  vim.cmd [[
  augroup terminal_setup | au!
  autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
  autocmd TermEnter * startinsert!
  augroup end
  ]]

  vim.api.nvim_create_autocmd({ "TermEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.cmd "startinsert"
      _G.set_terminal_keymaps()
    end,
  })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

  local Terminal = require("toggleterm.terminal").Terminal
  -- local float_term_key = "<m-\\>"
  local float_term_key = "<c-\\>"
  local float_term = Terminal:new {
    direction = "float",
    -- float_opts = {
    -- 	border = "curved",
    -- 	width = 120,
    -- 	height = 30,
    -- 	winblend = 0,
    -- },
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "n",
        -- "<c-\\>",
        float_term_key,
        "<cmd>1ToggleTerm direction=float<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "t",
        -- "<c-\\>",
        float_term_key,
        "<cmd>1ToggleTerm direction=float<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "i",
        -- "<c-\\>",
        float_term_key,
        "<cmd>1ToggleTerm direction=float<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(term.bufnr, "", float_term_key, "<nop>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "", float_term_key, "<nop>", { noremap = true, silent = true })
    end,
    count = 1,
  }

  function _FLOAT_TERM()
    float_term:toggle()
  end

  vim.api.nvim_set_keymap("n", float_term_key, "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("i", float_term_key, "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })

  -- local horizontal_term_key = "<m-;>"
  local horizontal_term_key = "<m-;>"
  local horizontal_term = Terminal:new {
    direction = "horizontal",
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "n",
        -- "<m-tab>",
        horizontal_term_key,
        "<cmd>3ToggleTerm direction=horizontal<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "t",
        -- "<m-tab>",
        horizontal_term_key,
        "<cmd>3ToggleTerm direction=horizontal<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "i",
        -- "<m-tab>",
        horizontal_term_key,
        "<cmd>3ToggleTerm direction=horizontal<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_buf_set_keymap(term.bufnr, "", horizontal_term_key, "<nop>", { noremap = true, silent = true })
    end,
    count = 3,
  }

  function _HORIZONTAL_TERM()
    horizontal_term:toggle(22)
  end

  vim.api.nvim_set_keymap(
    "n",
    horizontal_term_key,
    "<cmd>lua _HORIZONTAL_TERM()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "i",
    horizontal_term_key,
    "<cmd>lua _HORIZONTAL_TERM()<CR>",
    { noremap = true, silent = true }
  )
end

return M
