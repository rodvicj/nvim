-- stops commenting the next line when you press "o" after a commented line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

-- for yanking text in wsl
if vim.fn.has "wsl" == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {

    group = vim.api.nvim_create_augroup("Yank", { clear = true }),

    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg '"')
    end,
  })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    -- vim.opt_local.spell = true
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

-- Persistent Folds
vim.api.nvim_create_augroup("Persistent_Folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    vim.cmd.mkview()
  end,
  group = "Persistent_Folds",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview { mods = { emsg_silent = true } }
  end,
  group = "Persistent_Folds",
})

-- -- local general = vim.api.nvim_create_augroup("General", { clear = true })
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_create_augroup("General", { clear = true })
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   callback = function()
--     -- if vim.fn.getcmdtype() == "?" or vim.fn.getcmdtype() == "/" then
--     if vim.fn.getcmdtype() == "?" or vim.fn.getcmdtype() == "/" then
--       print("triggered / ?")
--       vim.keymap.set("n", "n", "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--       vim.keymap.set("n", "N", "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--       -- vim.opt.hlsearch = true
--     else
--       print("not search")
--       -- vim.opt.hlsearch = false
--       -- vim.keymap.set("n", "n", "<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--       -- vim.keymap.set("n", "N", "<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>", opts)
--     end
--   end,
--   -- group = general,
--   group = "General",
-- })
