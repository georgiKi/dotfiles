return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    priority = 950,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "fang2hou/blink-copilot",
    },
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        cmdline = { enabled = false },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        completion = {
            trigger = {
                show_on_keyword = true,
                show_on_insert_on_trigger_character = true,
                show_in_snippet = true,
                show_on_blocked_trigger_characters = {},
            },
            list = { max_items = 15 },
            menu = {
                border = "rounded",
                draw = { gap = 2 },
                winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                auto_show = true,
                window = {
                    scrollbar = false,
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
                },
            },
        },
        sources = {
            default = { "copilot", "lsp", "path", "buffer", "snippets" },
            providers = {
                copilot = {
                    score_offset = 100,
                    module = "blink-copilot",
                    async = true,
                    timeout_ms = 3000,
                },
                lsp = {
                    score_offset = 90,
                    min_keyword_length = 0,
                },
                buffer = {
                    score_offset = 50,
                },
                snippets = {
                    min_keyword_length = 3,
                    score_offset = 1,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = {
            enabled = false,
            window = {
                border = "rounded",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
        },
    },
}
