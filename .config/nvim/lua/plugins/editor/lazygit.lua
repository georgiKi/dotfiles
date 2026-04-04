return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>g", ":LazyGit<cr>", { desc = "Git" })
    end,
}
