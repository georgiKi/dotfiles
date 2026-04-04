return {
    "kyazdani42/nvim-tree.lua",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        { "projekt0n/circles.nvim", opts = { lsp = true } },
    },
    config = function()
        local circles = require("circles")

        require("nvim-tree").setup({
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            view = {
                adaptive_size = true,
                side = "left",
                width = 40,
            },
            renderer = {
                group_empty = true,
                icons = {
                    glyphs = circles.get_nvimtree_glyphs(),
                },
            },
            hijack_directories = {
                auto_open = false,
            },
            update_focused_file = {
                enable = false,
                update_root = false,
            },
        })

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "File Explorer" })
        vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<cr>", { desc = "Find File In Explorer" })
    end,
}
