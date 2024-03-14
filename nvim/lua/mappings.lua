require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- telescope resume last picker
map("n", "<leader><leader>", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })
-- open lazygit
map("n", "<leader>tl", "<cmd>LazyGit<CR>", { desc = "Open lazygit" })
