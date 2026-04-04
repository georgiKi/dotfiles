return {
    "axelvc/template-string.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        jsx_brackets = true,
        remove_template_string = true,
        restore_quotes = {
            normal = [["]],
            jsx = [["]],
        },
    },
}
