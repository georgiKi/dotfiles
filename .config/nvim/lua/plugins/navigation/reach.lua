return {
    "toppair/reach.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("reach").setup(opts)
        vim.keymap.set("n", "<leader>b", "<cmd>ReachOpen buffers<cr>", { desc = "Reach Buffers" })
    end,
}
