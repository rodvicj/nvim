-- lua/plugins/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = "echasnovski/mini.icons",

  -- Define keys that are not specific to the nvim-tree buffer
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
    { "<leader>n", "<cmd>NvimTreeCollapse<cr> | <cmd>NvimTreeFocus<cr> | <cmd>buffer<cr>", desc = "Collapse" },
  },

  -- `opts` will be passed to the setup function
  opts = function()
    -- `opts` can be a function that returns a table.
    -- This is useful for requiring modules that might not be available
    -- on startup, like your icons module.
    local icons = require "user.icons"

    -- Define the on_attach function inside the opts function
    -- This keeps it neatly contained.
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- default mappings
      api.config.mappings.default_on_attach(bufnr)
      -- custom mappings
      vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
      vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
      vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Parent")
    end

    -- Return the final options table
    return {
      on_attach = my_on_attach,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      view = {
        adaptive_size = true,
        centralize_selection = true,
        width = { min = 19, max = 30, padding = 0 },
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_label = ":t",
        indent_width = 0,
        indent_markers = { enable = false },
        icons = {
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          glyphs = {
            default = icons.ui.Text,
            symlink = icons.ui.FileSymlink,
            bookmark = icons.ui.BookMark,
            folder = {
              arrow_closed = icons.ui.ChevronRight,
              arrow_open = icons.ui.ChevronShortDown,
              default = icons.ui.Folder,
              open = icons.ui.FolderOpen,
              empty = icons.ui.EmptyFolder,
              empty_open = icons.ui.EmptyFolderOpen,
              symlink = icons.ui.FolderSymlink,
              symlink_open = icons.ui.FolderOpen,
            },
            git = {
              unstaged = icons.git.FileUnstaged,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              renamed = icons.git.FileRenamed,
              untracked = icons.git.FileUntracked,
              deleted = icons.git.FileDeleted,
              ignored = icons.git.FileIgnored,
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
      },
      filters = {
        dotfiles = true,
        custom = { "node_modules", "\\.cache" },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = icons.diagnostics.BoldHint,
          info = icons.diagnostics.BoldInformation,
          warning = icons.diagnostics.BoldWarning,
          error = icons.diagnostics.BoldError,
        },
      },
    }
  end,

  -- `config` function runs after the plugin is loaded and configured
  config = function(_, opts)
    -- The `opts` function will be resolved by lazy.nvim before this runs.
    require("nvim-tree").setup(opts)

    -- Set custom highlights. This is a side-effect that should
    -- run during configuration.
    vim.cmd [[hi NvimTreeExecFile guifg=#9ece6a gui=bold]]
  end,
}



-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"

--   local function opts(desc)
--     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end

--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)

--   -- custom mappings
--   vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
--   vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
--   vim.keymap.set("n", "l", api.node.open.edit, opts "Help")
--   vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Help")
--   -- ["<CR>"] = { api.node.open.edit, opts "Open" },
--   -- ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
--   -- ["C"] = { api.tree.change_root_to_node, opts "CD" },
--   -- ["<S-k>"] = { api.node.open.preview, opts "Open Preview" },
-- end

-- -- remove underlines in executable files
-- vim.cmd [[:hi NvimTreeExecFile guifg=#9ece6a gui=bold ]]

-- return {
--   "nvim-tree/nvim-tree.lua",
--   event = "VeryLazy",
--   -- dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     local icons = require "user.icons"

--     require("nvim-tree").setup {
--       on_attach = my_on_attach,
--       disable_netrw = false,
--       hijack_cursor = false,
--       hijack_netrw = true,
--       hijack_unnamed_buffer_when_opening = false,
--       -- sync_root_with_cwd = true, --uncommented to remove error from project.nvim
--       view = {
--         adaptive_size = true,
--         centralize_selection = true,
--         -- width = 19,
--         width = {
--           min = 19,
--           max = 30, -- can set max width if working on projects with very long names
--           padding = 0,
--         },
--         side = "left",
--         preserve_window_proportions = false,
--         number = false,
--         relativenumber = false,
--         signcolumn = "no", -- using value "no" to minimize left side padding of nvimtree when using ufo.nvim
--         float = {
--           enable = false,
--           quit_on_focus_loss = true,
--           open_win_config = {
--             relative = "editor",
--             border = "rounded",
--             width = 30,
--             height = 30,
--             row = 1,
--             col = 1,
--           },
--         },
--       },
--       -- actions = {
--       --   open_file = {
--       --     resize_window = true,
--       --   },
--       -- },
--       renderer = {
--         add_trailing = false,
--         group_empty = false,
--         highlight_git = false, --true in lvim
--         full_name = false,
--         highlight_opened_files = "none",
--         root_folder_label = ":t",
--         indent_width = 0,
--         indent_markers = {
--           enable = false,
--           inline_arrows = true,
--           icons = {
--             corner = "└",
--             edge = "│",
--             item = "│",
--             none = " ",
--           },
--         },
--         icons = {
--           git_placement = "before",
--           padding = " ",
--           symlink_arrow = " ➛ ",
--           glyphs = {
--             default = icons.ui.Text,
--             symlink = icons.ui.FileSymlink,
--             bookmark = icons.ui.BookMark,
--             folder = {
--               arrow_closed = icons.ui.ChevronRight,
--               arrow_open = icons.ui.ChevronShortDown,
--               default = icons.ui.Folder,
--               open = icons.ui.FolderOpen,
--               empty = icons.ui.EmptyFolder,
--               empty_open = icons.ui.EmptyFolderOpen,
--               symlink = icons.ui.FolderSymlink,
--               symlink_open = icons.ui.FolderOpen,
--             },
--             git = {
--               unstaged = icons.git.FileUnstaged,
--               staged = icons.git.FileStaged,
--               unmerged = icons.git.FileUnmerged,
--               renamed = icons.git.FileRenamed,
--               untracked = icons.git.FileUntracked,
--               deleted = icons.git.FileDeleted,
--               ignored = icons.git.FileIgnored,
--             },
--           },
--         },
--         special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
--         symlink_destination = true,
--       },
--       update_focused_file = {
--         enable = true,
--         debounce_delay = 15,
--         update_root = true,
--         ignore_list = {},
--       },
--       filters = {
--         dotfiles = true,
--         git_clean = false,
--         no_buffer = false,
--         custom = { "node_modules", "\\.cache" },
--         exclude = {},
--       },
--       diagnostics = {
--         enable = true,
--         show_on_dirs = false,
--         show_on_open_dirs = true,
--         debounce_delay = 50,
--         severity = {
--           min = vim.diagnostic.severity.HINT,
--           max = vim.diagnostic.severity.ERROR,
--         },
--         icons = {
--           hint = icons.diagnostics.BoldHint,
--           info = icons.diagnostics.BoldInformation,
--           warning = icons.diagnostics.BoldWarning,
--           error = icons.diagnostics.BoldError,
--         },
--       },
--     }

--     local wk = require "which-key"
--     wk.add {
--       { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
--       -- --   -- TODO: create nvimtree whichkey that is visible when using leader key
--       -- { "<S-tab>", "<cmd>NvimTreeCollapse<cr> | <cmd>NvimTreeFocus<cr> | <cmd>buffer<cr>", desc = "Collapse" },
--       { "<leader>n", "<cmd>NvimTreeCollapse<cr> | <cmd>NvimTreeFocus<cr> | <cmd>buffer<cr>", desc = "Collapse" },
--     }

--     -- local keymap = vim.keymap.set
--     -- local opts = { noremap = true, silent = true }

--     --   -- { "<S-tab>", "<cmd>NvimTreeCollapse<cr> | <cmd>NvimTreeFocus<cr> | <cmd>buffer<cr>", desc = "Collapse" },
--     -- -- keymap("n", "<s-tab>", "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
--     -- keymap("n", "<s-tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
--   end,
-- }
