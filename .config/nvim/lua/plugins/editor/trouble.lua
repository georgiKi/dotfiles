return {
    "folke/trouble.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        win = {
            wo = { wrap = true },
        },
    },
    config = function(_, opts)
        require("trouble").setup(opts)
        vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Diagnostics" })
    end,
}
