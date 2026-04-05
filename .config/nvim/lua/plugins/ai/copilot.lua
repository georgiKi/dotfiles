return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    event = "InsertEnter",
    opts = {
        panel = { enabled = false },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
                accept      = "¬",
                accept_word = "<M-w>",
                accept_line = "<M-e>",
                next        = "<M-]>",
                prev        = "<M-[>",
                dismiss     = "<C-]>",
            },
        },
        filetypes = {
            yaml         = false,
            markdown      = false,
            help          = false,
            gitcommit     = false,
            gitrebase     = false,
            ["."]         = false,
        },
    },
}
