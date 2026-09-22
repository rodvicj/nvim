-- -- PackChanged hooks must be defined BEFORE vim.pack.add()
-- vim.api.nvim_create_autocmd("PackChanged", {
-- 	callback = function(ev)
-- 		local name = ev.data.spec.name
-- 		local kind = ev.data.kind

-- 		-- Run TSUpdate after treesitter install/update
-- 		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
-- 			if not ev.data.active then
-- 				vim.cmd.packadd("nvim-treesitter")
-- 			end
-- 			vim.cmd("TSUpdate")
-- 		end
-- 	end,
-- })

vim.pack.add({
  'https://forge.barrettruth.com/barrettruth/live-server.nvim',
})

-- vim.pack.add({
-- 	-- Core UI
-- 	"https://github.com/folke/snacks.nvim",
-- 	"https://github.com/folke/which-key.nvim",
-- 	"https://github.com/nvim-tree/nvim-web-devicons",

-- 	-- Completion & LSP
-- 	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
-- 	"https://github.com/rafamadriz/friendly-snippets",
-- 	"https://github.com/giuxtaposition/blink-cmp-copilot",
-- 	"https://github.com/mason-org/mason.nvim",
-- 	"https://github.com/mason-org/mason-lspconfig.nvim",
-- 	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

-- 	-- Treesitter
-- 	"https://github.com/nvim-treesitter/nvim-treesitter",

-- 	-- Editor features
-- 	"https://github.com/folke/ts-comments.nvim",
-- 	"https://github.com/windwp/nvim-autopairs",
-- 	{ src = "https://github.com/karb94/neoscroll.nvim", version = "e786577" },
-- 	"https://github.com/jinh0/eyeliner.nvim",

-- 	-- Navigation & files
-- 	"https://github.com/nvim-neo-tree/neo-tree.nvim",
-- 	"https://github.com/nvim-lua/plenary.nvim",
-- 	"https://github.com/MunifTanjim/nui.nvim",
-- 	"https://github.com/stevearc/oil.nvim",
-- 	"https://github.com/ahmedkhalf/project.nvim",
-- 	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

-- 	-- Git
-- 	"https://github.com/lewis6991/gitsigns.nvim",

-- 	-- Formatting & linting
-- 	"https://github.com/stevearc/conform.nvim",
-- 	"https://github.com/mfussenegger/nvim-lint",

-- 	-- Breadcrumbs
-- 	"https://github.com/SmiteshP/nvim-navic",
-- 	"https://github.com/LunarVim/breadcrumbs.nvim",

-- 	-- AI & tools
-- 	"https://github.com/zbirenbaum/copilot.lua",
-- 	"https://github.com/kevinhwang91/nvim-bqf",
-- 	"https://github.com/catgoose/nvim-colorizer.lua",
-- })

-- :PackUpdate — update all plugins without confirmation
vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update(nil, { force = true })
end, { desc = "Update all vim.pack plugins (no confirmation)" })

-- :PackClean — remove plugins that are installed but no longer in vim.pack.add()
vim.api.nvim_create_user_command("PackClean", function()
	local installed = vim.pack.get()
	local orphans = {}
	for _, plugin in ipairs(installed) do
		if not plugin.active then
			table.insert(orphans, plugin.spec.name)
		end
	end

	if #orphans == 0 then
		vim.notify("No unused plugins found", vim.log.levels.INFO)
		return
	end

	vim.ui.select(
		{ "Yes", "No" },
		{ prompt = "Remove " .. #orphans .. " unused plugin(s): " .. table.concat(orphans, ", ") .. "?" },
		function(choice)
			if choice == "Yes" then
				vim.pack.del(orphans)
				vim.notify("Removed " .. #orphans .. " plugin(s)", vim.log.levels.INFO)
			end
		end
	)
end, { desc = "Remove unused vim.pack plugins" })

-- Auto-load all plugin configurations from lua/plugins/
local config_path = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.glob(config_path .. "/*.lua", false, true)) do
	local module = file:match("lua/(.+)%.lua$"):gsub("/", ".")
	local ok, err = pcall(require, module)
	if not ok then
		vim.notify("Error loading " .. module .. ": " .. err, vim.log.levels.WARN)
	end
end
