return {
  "neovim/nvim-lspconfig",
  priority = 900,
  lazy = true,
  event = "UIEnter",
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
        end

        map("n", "<leader>p", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, "LSP Hover")
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", function() require("telescope.builtin").lsp_references() end, "References")
        map("n", "<leader>r", function()
          require("telescope.builtin").lsp_references(
            require("telescope.themes").get_ivy({
              layout_config = { height = 20 },
              path_display = { "truncate" },
              show_line = true,
              trim_text = true,
              include_declaration = false,
            })
          )
        end, "References")
        map("n", "<leader>R", function()
          require("telescope.builtin").grep_string(
            require("telescope.themes").get_ivy({
              word_match = "-w",
              layout_config = { height = 20 },
              path_display = { "truncate" },
              show_line = true,
              trim_text = true,
            })
          )
        end, "Grep References")
        map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map({ "n", "v" }, "<leader>z", vim.lsp.buf.code_action, "Code action")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
      end,
    })

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          hint = { enable = true },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    vim.lsp.enable({ "lua_ls", "cssls", "cssmodules_ls", "jsonls", "eslint", "ts_ls" })
  end,
}
