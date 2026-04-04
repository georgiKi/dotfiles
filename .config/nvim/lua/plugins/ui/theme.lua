vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
    event = "UIEnter",
    opts = {
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = {},
        statementStyle = { bold = true },
        typeStyle = { italic = true },
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        transparent = true,
        dimInactive = false,
        globalStatus = true,
        terminalColors = true,
        theme = "default",
        colors = {
            theme = {
                all = {
                    ui = {

                        bg_gutter  = "NONE",
                        bg_m3      = "NONE",
                        bg_m2      = "NONE",
                        bg_m1      = "NONE",
                        bg         = "NONE",
                        bg_search  = "NONE",
                        bg_visual  = "GRAY",
                        bg_p1      = "NONE",
                        bg_p2      = "NONE",
                        fg_reverse = "NONE",
                        float      = {
                            bg = "NONE",
                        },
                    },
                },
            },
        },
        overrides = function()
            return {
                WinSeparator = { fg = "#24242e" },
            }
        end,
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd("colorscheme kanagawa")
        vim.cmd("highlight! link FloatBorder Normal")
        vim.cmd("highlight! link NormalFloat Normal")
        vim.opt.fillchars:append({ eob = " " })

        vim.api.nvim_set_hl(0, "LineNr",       { fg = "#54546d", bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#363646", bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#363646", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#dcd7ba", bg = "NONE", bold = true })

        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError",   { undercurl = true, sp = "#e46876" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",    { undercurl = true, sp = "#ff9e3b" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",    { undercurl = true, sp = "#7e9cd8" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",    { undercurl = true, sp = "#6a9589" })
        vim.api.nvim_set_hl(0, "DiagnosticError",            { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticWarn",             { fg = "#ff9e3b", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticInfo",             { fg = "#7e9cd8", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticHint",             { fg = "#6a9589", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingError",    { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn",     { fg = "#ff9e3b", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo",     { fg = "#7e9cd8", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingHint",     { fg = "#6a9589", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#e46876", bg = "NONE", italic = true })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#ff9e3b", bg = "NONE", italic = true })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = "#7e9cd8", bg = "NONE", italic = true })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = "#6a9589", bg = "NONE", italic = true })
        vim.api.nvim_set_hl(0, "DiagnosticSignError",        { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn",         { fg = "#ff9e3b", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo",         { fg = "#7e9cd8", bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint",         { fg = "#6a9589", bg = "NONE" })

        vim.api.nvim_set_hl(0, "BlinkCmpMenu",           { bg = "NONE",    fg = "#dcd7ba" })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder",     { bg = "NONE",    fg = "#54546d" })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection",  { bg = "#2d4f67", fg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpDoc",            { bg = "NONE",    fg = "#dcd7ba" })
        vim.api.nvim_set_hl(0, "BlinkCmpDocBorder",      { bg = "NONE",    fg = "#54546d" })
        vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine",  { bg = "#2d4f67", fg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpLabel",          { bg = "NONE",    fg = "#dcd7ba" })
        vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch",     { bg = "NONE",    fg = "#7e9cd8", bold = true })
        vim.api.nvim_set_hl(0, "BlinkCmpKind",           { bg = "NONE",    fg = "#957fb8" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindFunction",   { bg = "NONE",    fg = "#7e9cd8" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindMethod",     { bg = "NONE",    fg = "#7e9cd8" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindVariable",   { bg = "NONE",    fg = "#dcd7ba" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword",    { bg = "NONE",    fg = "#e46876" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet",    { bg = "NONE",    fg = "#98bb6c" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindText",       { bg = "NONE",    fg = "#727169" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindClass",      { bg = "NONE",    fg = "#ff9e3b" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindInterface",  { bg = "NONE",    fg = "#7fb4ca" })
        vim.api.nvim_set_hl(0, "BlinkCmpKindModule",     { bg = "NONE",    fg = "#e6c384" })

        vim.api.nvim_set_hl(0, "GitSignsAdd",          { fg = "#76946a", bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsChange",       { fg = "#e6c384", bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsDelete",       { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsTopdelete",    { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e46876", bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsUntracked",    { fg = "#727169", bg = "NONE" })


    end,
}
