return {
    name = "opencode",
    repo_path = "sudo-tee/opencode.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MeanderingProgrammer/render-markdown.nvim",
        "saghen/blink.cmp",
        "folke/snacks.nvim",
    },
    configFunc = function(plugin)
        local ok, render_md = pcall(require, "render-markdown")
        if ok then
            render_md.setup({
                anti_conceal = { enabled = false },
                file_types = { "markdown", "opencode_output" },
            })
        end
        return {}
    end,
}
