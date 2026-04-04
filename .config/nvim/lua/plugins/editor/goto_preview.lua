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
            stack_floating_preview_windows = true,
        })

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

        vim.keymap.set("n", "<leader>dd", require("goto-preview").goto_preview_definition, { desc = "Go To Definition" })
        vim.keymap.set("n", "<leader>db", require("goto-preview").close_all_win, { desc = "Close Preview" })

        vim.keymap.set("n", "<leader>dc", function()
            cleanup_stack()
            for _, win in ipairs(split_win_stack) do
                vim.api.nvim_win_close(win, true)
            end
            split_win_stack = {}
        end, { desc = "Close Definition Splits" })

        local function open_definition_in_split(buf, params)
            local origin_win = vim.api.nvim_get_current_win()

            cleanup_stack()

            if #split_win_stack > 0 then
                local last_win = split_win_stack[#split_win_stack]
                vim.api.nvim_set_current_win(last_win)
                vim.cmd("belowright split")
            else
                vim.api.nvim_set_current_win(origin_win)
                vim.cmd("botright vsplit")
            end

            local new_win = vim.api.nvim_get_current_win()
            table.insert(split_win_stack, new_win)

            vim.lsp.buf_request(buf, "textDocument/definition", params, function(err, result)
                if err or not result or vim.tbl_isempty(result) then return end
                local loc = vim.islist(result) and result[1] or result
                local uri = loc.uri or loc.targetUri
                local range = loc.range or loc.targetSelectionRange
                local target_buf = vim.uri_to_bufnr(uri)
                vim.fn.bufload(target_buf)
                vim.api.nvim_win_set_buf(new_win, target_buf)
                vim.api.nvim_win_set_cursor(new_win, { range.start.line + 1, range.start.character })
                vim.api.nvim_set_current_win(origin_win)
            end)
        end

        vim.keymap.set("n", "<leader>dv", function()
            local buf = vim.api.nvim_get_current_buf()
            local client = vim.lsp.get_clients({ bufnr = buf })[1]
            local params = vim.lsp.util.make_position_params(0, client and client.offset_encoding or "utf-16")
            require("goto-preview").close_all_win()
            open_definition_in_split(buf, params)
        end, { desc = "Open Definition In VSplit" })
    end,
}
