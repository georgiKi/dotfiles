local utils = require "core.utils"

---------------------------------------------------------------------------
-- NEOVIM Key Mappings
---------------------------------------------------------------------------

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Leader key
utils.keymap("", " ", "<Nop>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
utils.keymap("n", "<C-h>", "<C-w>h")
utils.keymap("n", "<C-j>", "<C-w>j")
utils.keymap("n", "<C-k>", "<C-w>k")
utils.keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
utils.keymap("n", "<Up>", ":resize +2<CR>")
utils.keymap("n", "<Down>", ":resize -2<CR>")
utils.keymap("n", "<Left>", ":vertical resize -2<CR>")
utils.keymap("n", "<Right>", ":vertical resize +2<CR>")

-- Navigate buffers
utils.keymap("n", "<S-l>", ":bnext<CR>")
utils.keymap("n", "<S-h>", ":bprevious<CR>")

-- Visual --
-- Stay in indent mode
utils.keymap("v", "<", "<gv")
utils.keymap("v", ">", ">gv")

-- Move text up and down
utils.keymap("v", "<S-j>", ":m .+1<CR>==")
utils.keymap("v", "<S-k>", ":m .-2<CR>==")

-- Persist copied value in clipboard
utils.keymap("v", "p", '"_dP')

-- Delete current buffer
utils.keymap("n", "<leader>x", ":bd<CR>", { desc = "Delete Buffer" })

-- Open diagnostic float window
utils.keymap(
    "n",
    "<leader>dt", "<cmd> lua vim.diagnostic.open_float(nil, {focus=false})<CR>",
    { desc = "Open Diagnostic Float" }
)

-- Session
vim.keymap.set("n", "<leader>sr", function()
    local config = require("core.config")
    if config.restore_session then
        config.restore_session()
    end
end, { desc = "Restore Session" })
