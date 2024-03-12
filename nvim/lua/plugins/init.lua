return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
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
      event = { "BufReadPre", "BufNewFile" },
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
          "stylua"
        },
          automatic_setup = true
        },
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
     end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
}
