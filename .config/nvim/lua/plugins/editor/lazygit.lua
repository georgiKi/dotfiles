return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = { shade_terminals = false },
    config = function(_, opts)
        require("toggleterm").setup(opts)

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = { border = "rounded" },
        })

        vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end, { desc = "Lazygit" })
        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal" })
        vim.keymap.set("t", "<Esc>",      "<cmd>ToggleTerm<cr>",                 { desc = "Close Terminal" })
    end,
}
