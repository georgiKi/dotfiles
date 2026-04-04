return {
    "hedyhli/outline.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        width = 15,
        show_symbol_details = false,
    },
    config = function(_, opts)
        require("outline").setup(opts)
        vim.keymap.set("n", "<leader>O", ":Outline<cr>", { desc = "Outline Tree" })
    end,
}
