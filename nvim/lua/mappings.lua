require("nvchad.mappings")

---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- telescope resume last picker
map("n", "<leader><leader>", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })
-- open lazygit
map("n", "<leader>tl", "<cmd>LazyGit<CR>", { desc = "Open lazygit" })

-- move text up and down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down in insert mode" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up in insert mode" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down in visual mode" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up in visual mode" })

-- breakpoints and debugger with nvim-dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add Breakpoint at this line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or Continue Debug" })

