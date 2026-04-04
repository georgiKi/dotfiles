return {
    "JellyApple102/easyread.nvim",
    priority = 950,
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("easyread").setup({})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                pcall(vim.cmd, "EasyreadToggle")
            end,
        })
    end,
}
