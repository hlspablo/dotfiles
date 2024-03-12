local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
-- add typscript support
lspconfig.tsserver.setup({
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("eslint_fix_creator", { clear = true }),
  desc = "Create autocommand in buffers where eslint attaches",
  callback = function(args)
    if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "Fix all eslint errors",
        buffer = args.buf,
        group = vim.api.nvim_create_augroup(("eslint_fix_%d"):format(args.buf), { clear = true }),
        callback = function()
          if vim.fn.exists(":EslintFixAll") > 0 then
            vim.cmd.EslintFixAll()
          end
        end,
      })
    end
  end,
})
