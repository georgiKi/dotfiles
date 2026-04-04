return {
    "sindrets/diffview.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("diffview").setup(opts)
        vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>",           { desc = "Diff View" })
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",  { desc = "File History" })
        vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>",          { desc = "Close Diff View" })
    end,
}
