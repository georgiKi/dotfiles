return {
    name = "which-key",
    repo_path = "folke/which-key.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    config = {
        preset = "modern",
        delay = 400,
        icons = {
            breadcrumb = "»",
            separator = "→",
            group = " ",
            rules = {},
            colors = true,
        },
        keys = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        layout = {
            width = { min = 20, max = 40 },
            spacing = 3,
        },
        win = {
            no_overlap = false,
            col = math.huge,
            row = math.huge,
            width = { max = math.floor(vim.o.columns * 0.4) },
            height = { max = 20 },
            border = "rounded",
            padding = { 1, 2 },
            title = false,
            wo = { winblend = 0 },
        },
        sort = { "local", "order", "group", "alphanum", "mod" },
    }
}
