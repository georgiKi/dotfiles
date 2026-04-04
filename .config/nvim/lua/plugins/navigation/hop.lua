return {
    "smoka7/hop.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
    },
    config = function(_, opts)
        require("hop").setup(opts)
        vim.keymap.set("n", "<leader>h", "<cmd>HopWord<cr>", { desc = "Hop Word" })
    end,
}
