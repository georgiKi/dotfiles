return {
    "nvim-telescope/telescope.nvim",
    priority = 950,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                layout_config = {
                    horizontal = { preview_width = 0.55 },
                },
                mappings = {
                    i = {
                        ["<CR>"] = function(bufnr)
                            local action_state = require("telescope.actions.state")
                            if action_state.get_selected_entry() == nil then return end
                            require("telescope.actions").select_default(bufnr)
                        end,
                    },
                    n = {
                        ["<CR>"] = function(bufnr)
                            local action_state = require("telescope.actions.state")
                            if action_state.get_selected_entry() == nil then return end
                            require("telescope.actions").select_default(bufnr)
                        end,
                    },
                },
            },
        })

        local dropdown = themes.get_dropdown({ previewer = false })

        vim.keymap.set("n", "<leader>ff", function() builtin.find_files(dropdown) end,        { desc = "Find File" })
        vim.keymap.set("n", "<leader>i",  function() builtin.live_grep() end,                 { desc = "Search Text" })
        vim.keymap.set("n", "<leader>fb", function() builtin.buffers(dropdown) end,           { desc = "Find Buffer" })
        vim.keymap.set("n", "<leader>fr", function() builtin.oldfiles(dropdown) end,          { desc = "Recent Files" })
        vim.keymap.set("n", "<leader>fw", function() builtin.grep_string() end,               { desc = "Search Word Under Cursor" })
        vim.keymap.set("n", "<leader>fk", function() builtin.keymaps() end,                   { desc = "Find Keymaps" })
        vim.keymap.set("n", "<leader>fd", function() builtin.diagnostics() end,               { desc = "Workspace Diagnostics" })
        vim.keymap.set("n", "<leader>fs", function() builtin.lsp_document_symbols() end,      { desc = "Document Symbols" })
        vim.keymap.set("n", "<leader>fc", function() builtin.command_history(dropdown) end,   { desc = "Command History" })
        vim.keymap.set("n", "<leader>/",  function()
            if vim.api.nvim_buf_is_valid(vim.api.nvim_get_current_buf()) and vim.bo.buftype == "" then
                builtin.current_buffer_fuzzy_find(dropdown)
            end
        end, { desc = "Search In Buffer" })
    end,
}
