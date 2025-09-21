-- return {}

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = false,
			sources = {
				-- require "none-ls.diagnostics.flake8",
				-- require("none-ls.diagnostics.flake8").with {
				--   extra_args = { "--ignore=E501,E203,F821,F401,W504,E303,W292" },
				-- },

				formatting.stylua,
				-- formatting.stylua.with({
				-- 	extra_args = {
				-- 		"--indent-type",
				-- 		"Spaces",
				-- 		"--indent-width",
				-- 		"4",
				-- 		"--call-parentheses",
				-- 		"Always",
				-- 	},
				-- }),
				formatting.prettier,
				-- formatting.prettier.with {
				--   -- extra_filetypes = { "toml" },
				--   filetypes = { "javascript", "html" },
				--   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
				-- },
				-- formatting.yapf,
				-- -- use black when you have to change single quotes to double quotes in python
				-- formatting.black,

				-- for htmldjango
				formatting.djlint.with({
					-- extra_filetypes = { "html", "htmldjango" },
					extra_args = {
						"--indent=2",
						"--max-blank-lines=1",
						"--blank-line-after-tag=extends",
						"--close-void-tags",
					},
				}),
				-- null_ls.builtins.completion.spell,
			},
		})
	end,
}
