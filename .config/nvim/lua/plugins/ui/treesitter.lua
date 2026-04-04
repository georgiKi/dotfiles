return {
  "nvim-treesitter/nvim-treesitter",
  priority = 950,
  lazy = true,
  event = "VeryLazy",
  tag = "v0.9.3",
  dependencies = { "windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-context" },
  config = function()
    require("nvim-ts-autotag").setup()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "c_sharp", "lua", "vim", "regex", "javascript", "typescript", "tsx", "css", "scss", "html", "json" },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = { "c", "rust" },
        additional_vim_regex_highlighting = { "html" },
      },
    })
    require("treesitter-context").setup({
      max_lines = 3,
      trim_scope = "outer",
    })
  end,
}
