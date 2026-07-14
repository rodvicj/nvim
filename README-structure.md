# Neovim Configuration Structure

This repository uses a modular structure powered by [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. This document serves as a guide to understanding the directory layout and how to safely extend or modify the configuration.

## Directory Layout

```text
~/.config/nvim
├── ftplugin/            # Filetype specific configurations (e.g., settings applied only for Python or Lua)
├── lsp/                 # Custom LSP configurations, handlers, or snippets
├── lua/
│   ├── config/          # Core Neovim configurations
│   ├── function/        # Helper Lua functions used across the configuration
│   ├── plugins/         # Plugin definitions and their specific setups
│   └── user/            # Space for personal overrides or custom user modules
├── init.lua             # Main entry point for Neovim
└── lazy-lock.json       # Lockfile ensuring consistent plugin versions
```

## `lua/config/` (The Core)

This directory contains the foundational settings for Neovim:

*   **`options.lua`**: Global vim options (e.g., `vim.opt.number`, `vim.opt.relativenumber`, indentation settings).
*   **`keymaps.lua`**: Core key mappings that are not specific to a single plugin.
*   **`autocmds.lua`**: Autocommands that trigger functions based on Neovim events (like highlighting text on yank).
*   **`commands.lua`**: Custom user commands available in the command line (e.g., `:MyCommand`).
*   **`lazy.lua`**: The bootstrap script for `lazy.nvim` that loads the `lua/plugins/` directory.

## `lua/plugins/` (Plugin Management)

Each file in this directory represents a plugin or a suite of related plugins. Because we use `lazy.nvim`, every file should return a Lua table containing the plugin specification.

For example, a file `lua/plugins/myplugin.lua` might look like:

```lua
return {
  "author/plugin-name",
  event = "VeryLazy", -- Lazy loading triggers
  config = function()
    require("plugin-name").setup({})
  end,
}
```

By placing a file here, `lazy.nvim` will automatically detect and load it according to the specified triggers.

## Common Workflows

### 1. Adding a New Plugin
Simply create a new `.lua` file in the `lua/plugins/` directory and return the plugin spec. `lazy.nvim` will automatically pick it up.

### 2. Changing Keybindings
*   For general Neovim mappings, edit `lua/config/keymaps.lua`.
*   For plugin-specific mappings, locate the relevant file in `lua/plugins/` (e.g., `telescope.lua` or `whichkey.lua`) and modify the `keys` table or the `config` function.

### 3. Configuring Language Servers (LSP)
This config leverages `mason.nvim` and `nvim-lspconfig`. 
*   **To install a new LSP or formatter:** You can use the `:Mason` UI, or add it to the ensure_installed list in `lua/plugins/mason.lua` or `lua/plugins/mason-tool-installer.lua`.
*   **To configure a specific language server:** Look into `lua/plugins/lspconfig.lua` and add your server to the setup loop or provide a custom configuration table.

### 4. Overriding Core Settings
If you want to maintain the core structure but add your own flavor, consider placing your scripts in `lua/user/` and requiring them from `init.lua`, or simply tweak the files directly in `lua/config/`.
