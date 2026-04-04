return {
    "LintaoAmons/bookmarks.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "kkharji/sqlite.lua",
        "nvim-telescope/telescope.nvim",
        "stevearc/dressing.nvim",
    },
    config = function()
        require("bookmarks").setup({
            navigation = {
                next_prev_wraparound_same_file = true,
            },
            signs = {
                mark = {
                    icon = "󰃁",
                    color = "#7e9cd8",
                    line_bg = "#1f2335",
                },
                desc_format = function(bookmark)
                    return bookmark.order .. ": " .. bookmark.name
                end,
            },
            picker = {
                sort_by = "last_visited",
            },
            calibrate = {
                auto_calibrate_cur_buf = true,
                show_calibrate_logs = false,
            },
            treeview = {
                window_split_dimension = 40,
                highlights = {
                    active_list = {
                        bg = "#2d4f67",
                        fg = "#dcd7ba",
                        bold = true,
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ba", "<cmd>BookmarksMark<cr>",     { desc = "Add Bookmark" })
        vim.keymap.set("n", "<leader>be", "<cmd>BookmarksTree<cr>",     { desc = "Bookmarks Tree" })
        vim.keymap.set("n", "<leader>bg", "<cmd>BookmarksGoto<cr>",     { desc = "Go to Bookmark" })
        vim.keymap.set("n", "<leader>bn", "<cmd>BookmarksGotoNext<cr>", { desc = "Next Bookmark" })
        vim.keymap.set("n", "<leader>bp", "<cmd>BookmarksGotoPrev<cr>", { desc = "Prev Bookmark" })
        vim.keymap.set("n", "<leader>bl", "<cmd>BookmarksList<cr>",     { desc = "List Bookmarks" })
    end,
}
