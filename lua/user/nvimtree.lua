local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  commit = "05f55c1fd6470b31627655c528245794e3cd4b2c", -- fixed annoying highlight in nvimtree if a file is executable
}

function M.my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "l", api.node.open.edit, opts "Help")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Help")
  -- ["<CR>"] = { api.node.open.edit, opts "Open" },
  -- ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
  -- ["C"] = { api.tree.change_root_to_node, opts "CD" },
  -- ["<S-k>"] = { api.node.open.preview, opts "Open Preview" },
end

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  }

  local icons = require "user.icons"

  require("nvim-tree").setup {
    on_attach = M.my_on_attach,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    view = {
      adaptive_size = false,
      centralize_selection = true,
      width = 30,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false, --true in lvim
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
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
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },
    filters = {
      dotfiles = true,
      git_clean = false,
      no_buffer = false,
      custom = { "node_modules", "\\.cache" },
      exclude = {},
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
end
return M
