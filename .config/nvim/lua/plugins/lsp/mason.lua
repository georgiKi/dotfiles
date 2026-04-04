return {
    "williamboman/mason.nvim",
    priority = 950,
    lazy = true,
    event = "UIEnter",
    build = ":MasonUpdate",
    opts = {},
}
