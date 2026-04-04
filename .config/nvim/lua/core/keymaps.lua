local map = vim.keymap.set

---------------------------------------------------------------------------
-- NEOVIM Key Mappings
---------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("", " ", "<Nop>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<Up>",    ":resize +2<CR>")
map("n", "<Down>",  ":resize -2<CR>")
map("n", "<Left>",  ":vertical resize -2<CR>")
map("n", "<Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<S-j>", ":m .+1<CR>==")
map("v", "<S-k>", ":m .-2<CR>==")

-- Persist copied value in clipboard
map("v", "p", '"_dP')

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Delete current buffer
map("n", "<leader>x", ":bd<CR>", { desc = "Delete Buffer" })

-- Toggle comment
map("n", "<leader>c", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>c", "gc",  { desc = "Toggle Comment", remap = true })

-- Open diagnostic float window
map("n", "<leader>dt", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", { desc = "Open Diagnostic Float" })

-- Session
map("n", "<leader>sr", function()
    local config = require("core.config")
    if config.restore_session then
        config.restore_session()
    end
end, { desc = "Restore Session" })
