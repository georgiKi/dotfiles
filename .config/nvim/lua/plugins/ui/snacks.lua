return {
    "folke/snacks.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        dim = { enabled = false },

    },
    config = function(_, opts)
        require("snacks").setup(opts)

        vim.keymap.set("n", "<leader>td", function()
            local dim = require("snacks").dim
            if dim.enabled then
                dim.disable()
            else
                dim.enable()
            end
        end, { desc = "Toggle Dim" })
    end,
}
