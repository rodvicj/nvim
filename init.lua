require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
require "user.commands"
spec "user.colorscheme"
spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
spec "user.illuminate"
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.comment"
spec "user.lualine"
spec "user.navic"
spec "user.breadcrumbs"
spec "user.harpoon"
spec "user.neotest"
spec "user.autopairs"
spec "user.neogit"
spec "user.alpha"
spec "user.project"
spec "user.indentline"
spec "user.toggleterm"
spec "user.bufferline"
spec "user.autotag"
spec "user.none-ls"
spec "user.markdown-preview"

-- Extras
spec "user.extras.colorizer"
spec "user.extras.fidget"
spec "user.extras.rainbow-delimiters"
spec "user.extras.neoscroll"
spec "user.extras.todo-comments"
spec "user.extras.scrollbar"
spec "user.extras.typescript-tools"
spec "user.extras.live-server"
spec "user.extras.dadbod-ui"

require "user.lazy"
-- d shift 4 -- deletes current cursor up to last char in the same line
-- 5e875ae8d07dd204ce5b1d97a8acf70e3835b40b --jsx treesitter highlight still not messed up
-- c30ebb17f6b98625e3db8f032c2223876bb60f99 --commit that messed up my jsx, htmldjango treesitter highlight
