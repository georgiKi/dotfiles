return {
    "rmagatti/goto-preview",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("goto-preview").setup({
            width = 120,
            height = 25,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            default_mappings = false,
            focus_on_open = true,
            dismiss_on_move = false,
            stack_floating_preview_windows = false,
        })

        vim.keymap.set("n", "<leader>dd", require("goto-preview").goto_preview_definition, { desc = "Preview Definition" })
        vim.keymap.set("n", "<leader>db", require("goto-preview").close_all_win, { desc = "Close Preview" })

        local split_win_stack = {}

        local function cleanup_stack()
            local valid = {}
            for _, win in ipairs(split_win_stack) do
                if vim.api.nvim_win_is_valid(win) then
                    table.insert(valid, win)
                end
            end
            split_win_stack = valid
        end

        vim.keymap.set("n", "<leader>dc", function()
            cleanup_stack()
            for _, win in ipairs(split_win_stack) do
                vim.api.nvim_win_close(win, true)
            end
            split_win_stack = {}
        end, { desc = "Close All Definition Splits" })

        vim.keymap.set("n", "<leader>dC", function()
            cleanup_stack()
            local curr_win = vim.api.nvim_get_current_win()
            local index
            for i, win in ipairs(split_win_stack) do
                if win == curr_win then index = i break end
            end
            if not index then return end
            table.remove(split_win_stack, index)
            vim.api.nvim_win_close(curr_win, true)
            if #split_win_stack > 0 then
                local prev = split_win_stack[math.min(index, #split_win_stack)]
                if vim.api.nvim_win_is_valid(prev) then
                    vim.api.nvim_set_current_win(prev)
                end
            end
        end, { desc = "Close Definition Split" })

        vim.keymap.set("n", "<leader>dv", function()
            local all_wins = vim.api.nvim_tabpage_list_wins(0)
            local preview_win, preview_buf, preview_cursor

            for _, win in ipairs(all_wins) do
                local ok, val = pcall(vim.api.nvim_win_get_var, win, "is-goto-preview-window")
                if ok and val == 1 then
                    preview_win = win
                    preview_buf = vim.api.nvim_win_get_buf(win)
                    preview_cursor = vim.api.nvim_win_get_cursor(win)
                    break
                end
            end

            if not preview_win then return end

            require("goto-preview").close_all_win()

            cleanup_stack()
            if #split_win_stack > 0 then
                vim.api.nvim_set_current_win(split_win_stack[#split_win_stack])
                vim.cmd("belowright split")
            else
                vim.cmd("botright vsplit")
            end

            local new_win = vim.api.nvim_get_current_win()
            table.insert(split_win_stack, new_win)
            vim.api.nvim_win_set_buf(new_win, preview_buf)
            vim.api.nvim_win_set_cursor(new_win, preview_cursor)
        end, { desc = "Open Definition In VSplit" })
    end,
}
