return {
  name = "mason-lspconfig",
  repo_path = "williamboman/mason-lspconfig.nvim",
  priority = 890,
  enabled = true,
  lazy = true,
  event = "VeryLazy",
  config = {
    ensure_installed = {
      "lua_ls",
      "quick_lint_js",
      "cssls",
      "cssmodules_ls",
      "jsonls",
      "eslint"
    },
    automatic_installation = true,
  },
  artifacts = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.diagnostic.config({ virtual_text = false })

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end,
    })
  end
}
