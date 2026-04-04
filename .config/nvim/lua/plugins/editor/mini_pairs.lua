return {
    "echasnovski/mini.pairs",
    lazy = true,
    event = "VeryLazy",
    opts = {
        modes = { insert = true, command = false, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
    },
}
