return {
  "folke/noice.nvim",
  enabled = true,
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
        render = 'wrapped-compact',
        stages = 'static',
        max_width = 50,
        top_down = false,
      },
    },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { silent = true },
    },
    routes = {
        {
            filter = { event = "msg_show", find = "NvimTree" },
            opts = { skip = true },
        },
        {
            filter = { event = "cmdline", find = "NvimTree" },
            opts = { skip = true },
        },
    },
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    }
  }
}
