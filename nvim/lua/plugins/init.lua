return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = function()
			return require("configs.copilot")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		event = "VeryLazy",
		opts = function()
			return require("configs.null-ls")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			ensure_installed = {
				"eslint-lsp",
				"typescript-language-server",
				"lua-language-server",
				"html-lsp",
				"prettier",
				"stylua",
			},
			automatic_setup = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},
}
