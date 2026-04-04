return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        signs = {
            add          = { text = "▎" },
            change       = { text = "▎" },
            delete       = { text = "" },
            topdelete    = { text = "" },
            changedelete = { text = "▎" },
            untracked    = { text = "▎" },
        },
        current_line_blame = false,
        current_line_blame_opts = {
            delay = 300,
            virt_text_pos = "eol",
        },
    },
    config = function(_, opts)
        local gitsigns = require("gitsigns")
        gitsigns.setup(opts)

        vim.keymap.set("n", "]h", gitsigns.next_hunk,                                    { desc = "Next Hunk" })
        vim.keymap.set("n", "[h", gitsigns.prev_hunk,                                    { desc = "Prev Hunk" })
        vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame,            { desc = "Toggle Line Blame" })
        vim.keymap.set("n", "<leader>gB", gitsigns.blame,                                { desc = "Blame Window" })
        vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk,                         { desc = "Preview Hunk" })
        vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk,                           { desc = "Stage Hunk" })
        vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk,                      { desc = "Undo Stage Hunk" })
        vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk,                           { desc = "Reset Hunk" })
        vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer,                         { desc = "Reset Buffer" })
    end,
}
