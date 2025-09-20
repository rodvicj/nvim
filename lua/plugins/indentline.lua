local icons = require "user.icons"

return {
  "nvimdev/indentmini.nvim",
  enabled = true,
  opts = {
    char = icons.ui.LineLeft,
    minlevel = 1,
    only_current = false,
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
  },
}
