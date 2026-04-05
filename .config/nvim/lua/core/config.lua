---------------------------------------------------------------------------
-- Vim Configuration
---------------------------------------------------------------------------
-- shiftwidth = 2,            -- the number of spaces inserted for each indentation
-- tabstop = 2,               -- insert 2 spaces for a tab
-- numberwidth = 2,           -- set number column width to 2 {default 4}

local config = {
    backup = false,
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,          -- so that `` is visible in markdown files
    fileencoding = "utf-8",
    hlsearch = true,           -- highlight all matches on previous search pattern
    ignorecase = true,         -- ignore case in search patterns
    mouse = "a",               -- allow the mouse to be used in neovim
    pumheight = 10,            -- pop up menu height
    showmode = false,          -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0,           -- always show tabs
    smartcase = true,          -- smart case
    smartindent = true,        -- make indenting smarter again
    splitbelow = true,         -- force all horizontal splits to go below current window
    splitright = true,         -- force all vertical splits to go to the right of current window
    swapfile = false,          -- creates a swapfile
    timeoutlen = 400,          -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,           -- enable persistent undo
    updatetime = 200,          -- faster completion (4000ms default)
    writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,          -- convert tabs to spaces
    shiftwidth = 2,            -- the number of spaces inserted for each indentation
    tabstop = 2,               -- insert 2 spaces for a tab
    cursorline = false,        -- highlight the current line
    number = true,             -- set numbered lines
    relativenumber = false,    -- set relative numbered lines
    numberwidth = 2,           -- set number column width to 2 {default 4}
    signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
    wrap = false,              -- display lines as one long line
    scrolloff = 8,
    sidescrolloff = 8,
    shadafile = "NONE"
}

vim.opt.shortmess:append "c"

for key, value in pairs(config) do
    vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {
        prefix = "●",
        spacing = 4,
        source = "if_many",
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌶 ",
        },
    },
    float = {
        border = "rounded",
        width = 80,
        source = true,
    },
})

-- Cache lua files
vim.loader.enable()

-- Highlight word occurences under cursor
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client:supports_method("textDocument/documentHighlight") then
                vim.lsp.buf.document_highlight()
                return
            end
        end
    end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function() vim.lsp.buf.clear_references() end,
})

-- Session management
vim.opt.sessionoptions:remove("folds")
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
vim.fn.mkdir(session_dir, "p")

local function session_file()
    local cwd = vim.fn.getcwd():gsub("/", "%%")
    return session_dir .. cwd .. ".vim"
end

local M = {}

M.restore_session = function()
    local f = session_file()
    if vim.fn.filereadable(f) == 1 then
        local ok, tree_api = pcall(require, "nvim-tree.api")
        if ok then tree_api.tree.close() end
        pcall(vim.cmd, "source " .. vim.fn.fnameescape(f))
        vim.notify("Session restored", vim.log.levels.INFO)
    else
        vim.notify("No session found for this directory", vim.log.levels.WARN)
    end
end

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local ok, tree_api = pcall(require, "nvim-tree.api")
        if ok then tree_api.tree.close() end
        vim.cmd("mksession! " .. vim.fn.fnameescape(session_file()))
    end,
})

-- Fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
vim.wo.fillchars = "fold: "
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
vim.wo.foldlevel = 99

return M
