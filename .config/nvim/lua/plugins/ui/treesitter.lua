return {
  "nvim-treesitter/nvim-treesitter",
  priority = 950,
  lazy = true,
  event = "VeryLazy",
  dependencies = { "windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-context" },
  config = function()
    vim.env.PATH = vim.env.PATH .. ":/opt/homebrew/bin"
    require("nvim-ts-autotag").setup()
    require("nvim-treesitter").setup()
    local install = require("nvim-treesitter.install")
    local parsers = { "c", "c_sharp", "lua", "vim", "regex", "javascript", "typescript", "tsx", "css", "scss", "html",
      "json", "markdown", "markdown_inline", "jsdoc" }
    install.install(parsers, { skip_installed = true })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
    require("treesitter-context").setup({
      max_lines = 3,
      trim_scope = "outer",
    })
  end,
}
