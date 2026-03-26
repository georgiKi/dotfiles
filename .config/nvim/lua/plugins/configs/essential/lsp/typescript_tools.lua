return {
    name = "typescript-tools",
    repo_path = "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    configFunc = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("typescript-tools").setup({
            capabilities = capabilities,
            settings = {
                separate_diagnostic_server = true,
                publish_diagnostic_on = "insert_leave",
                expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused_imports" },
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                    importModuleSpecifierPreference = "non-relative",
                },
                tsserver_format_options = {
                    allowIncompleteCompletions = false,
                    allowRenameOfImportPath = false,
                },
            },
        })
    end,
}
