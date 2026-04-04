return {
    "nvim-lualine/lualine.nvim",
    priority = 900,
    lazy = true,
    event = "VeryLazy",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        local lualine = require("lualine")
        local custom_theme = require("lualine.themes.everforest")

        custom_theme.inactive.c.bg = nil
        custom_theme.visual.c.bg   = nil
        custom_theme.replace.c.bg  = nil
        custom_theme.insert.c.bg   = nil
        custom_theme.command.c.bg  = nil
        custom_theme.normal.c.bg   = nil

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = custom_theme,
                component_separators = "|",
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "NvimTree", "Outline" },
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        color = function()
                            local colors = {
                                n  = { fg = "#7e9cd8", bg = "NONE", gui = "bold" },
                                i  = { fg = "#98bb6c", bg = "NONE", gui = "bold" },
                                v  = { fg = "#ffa066", bg = "NONE", gui = "bold" },
                                V  = { fg = "#ffa066", bg = "NONE", gui = "bold" },
                                c  = { fg = "#e6c384", bg = "NONE", gui = "bold" },
                                R  = { fg = "#e46876", bg = "NONE", gui = "bold" },
                            }
                            return colors[vim.fn.mode()] or { fg = "#957fb8", bg = "NONE", gui = "bold" }
                        end,
                    },
                },
                lualine_b = { "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "branch" },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
