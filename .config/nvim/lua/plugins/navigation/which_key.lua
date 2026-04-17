return {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 400,
        icons = {
            breadcrumb = "»",
            separator = "→",
            group = "",
            colors = false,
            mappings = false,
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
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        vim.api.nvim_set_hl(0, "WhichKey",          { fg = "#7e9cd8", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "WhichKeyDesc",      { fg = "#dcd7ba", bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyGroup",     { fg = "#957fb8", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#54546d", bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyFloat",     { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder",    { fg = "#54546d", bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyValue",     { fg = "#727169", bg = "NONE" })
    end,
}
