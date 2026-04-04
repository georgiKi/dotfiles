return {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
            languages = {
                css  = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
            },
        })

        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
}
