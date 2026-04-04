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


    end,
}
