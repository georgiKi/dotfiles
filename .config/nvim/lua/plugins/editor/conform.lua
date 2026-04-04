return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            javascript      = { "prettier" },
            typescript      = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css             = { "prettier" },
            scss            = { "prettier" },
            html            = { "prettier" },
            json            = { "prettier" },
            markdown        = { "prettier" },
            lua         = { "stylua" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
