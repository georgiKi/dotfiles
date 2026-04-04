return {
    "williamboman/mason-lspconfig.nvim",
    priority = 890,
    lazy = true,
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            "lua_ls",
            "ts_ls",
            "quick_lint_js",
            "cssls",
            "cssmodules_ls",
            "jsonls",
            "eslint",
        },
        automatic_installation = true,
    },
}
