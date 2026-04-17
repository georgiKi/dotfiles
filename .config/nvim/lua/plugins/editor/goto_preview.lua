return {
    "rmagatti/goto-preview",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local gp = require("goto-preview")
        local split_win_stack = {}

        local function cleanup_stack()
            split_win_stack = vim.tbl_filter(vim.api.nvim_win_is_valid, split_win_stack)
        end

        local function get_preview_win()
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local ok, val = pcall(vim.api.nvim_win_get_var, win, "is-goto-preview-window")
                if ok and val == 1 then return win end
            end
        end

        local function open_in_vsplit()
            local preview_win = get_preview_win()
            if not preview_win then return end

            local buf    = vim.api.nvim_win_get_buf(preview_win)
            local cursor = vim.api.nvim_win_get_cursor(preview_win)

            gp.close_all_win()
            cleanup_stack()

            if #split_win_stack > 0 then
                vim.api.nvim_set_current_win(split_win_stack[#split_win_stack])
                vim.cmd("belowright split")
            else
                vim.cmd("botright vsplit")
            end

            local new_win = vim.api.nvim_get_current_win()
            table.insert(split_win_stack, new_win)
            vim.api.nvim_win_set_buf(new_win, buf)
            vim.api.nvim_win_set_cursor(new_win, cursor)
        end

        local function close_split()
            cleanup_stack()
            local curr_win = vim.api.nvim_get_current_win()
            local index
            for i, win in ipairs(split_win_stack) do
                if win == curr_win then index = i break end
            end
            if not index then return end
            table.remove(split_win_stack, index)
            vim.api.nvim_win_close(curr_win, true)
            local prev = split_win_stack[math.min(index, #split_win_stack)]
            if prev and vim.api.nvim_win_is_valid(prev) then
                vim.api.nvim_set_current_win(prev)
            end
        end

        local function close_all_splits()
            cleanup_stack()
            for _, win in ipairs(split_win_stack) do
                vim.api.nvim_win_close(win, true)
            end
            split_win_stack = {}
        end

        gp.setup({
            width = 120,
            height = 25,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            default_mappings = false,
            focus_on_open = true,
            dismiss_on_move = false,
            stack_floating_preview_windows = false,
        })

        local function jump_to_vsplit()
            local buf = vim.api.nvim_get_current_buf()
            local client = vim.lsp.get_clients({ bufnr = buf })[1]
            if not client then return end
            local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
            vim.lsp.buf_request(buf, "textDocument/definition", params, function(err, result)
                if err or not result or vim.tbl_isempty(result) then return end
                local loc = vim.islist(result) and result[1] or result
                local uri = loc.uri or loc.targetUri
                local range = loc.range or loc.targetSelectionRange
                local target_buf = vim.uri_to_bufnr(uri)
                vim.fn.bufload(target_buf)
                cleanup_stack()
                if #split_win_stack > 0 then
                    vim.api.nvim_set_current_win(split_win_stack[#split_win_stack])
                    vim.cmd("belowright split")
                else
                    vim.cmd("botright vsplit")
                end
                local new_win = vim.api.nvim_get_current_win()
                table.insert(split_win_stack, new_win)
                vim.api.nvim_win_set_buf(new_win, target_buf)
                vim.api.nvim_win_set_cursor(new_win, { range.start.line + 1, range.start.character })
            end)
        end

        vim.keymap.set("n", "<leader>dd", gp.goto_preview_definition, { desc = "Preview Definition" })
        vim.keymap.set("n", "<leader>db", gp.close_all_win,            { desc = "Close Preview" })
        vim.keymap.set("n", "<leader>dv", open_in_vsplit,              { desc = "Preview Definition In VSplit" })
        vim.keymap.set("n", "<leader>ds", jump_to_vsplit,              { desc = "Definition In VSplit" })
        vim.keymap.set("n", "<leader>dC", close_split,                 { desc = "Close Definition Split" })
        vim.keymap.set("n", "<leader>dc", close_all_splits,            { desc = "Close All Definition Splits" })
    end,
}
