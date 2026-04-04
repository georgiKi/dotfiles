return {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        input = {
            enabled = true,
            border = "rounded",
            relative = "cursor",
        },
        select = {
            enabled = true,
            backend = { "telescope", "builtin" },
            telescope = require("telescope.themes").get_cursor({
                layout_config = { width = 60, height = 15 },
            }),
            builtin = {
                border = "rounded",
                relative = "cursor",
            },
        },
    },
}
