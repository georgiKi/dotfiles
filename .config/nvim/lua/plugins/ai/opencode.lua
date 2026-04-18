return {
	"sudo-tee/opencode.nvim",
	enabled = false,
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		"saghen/blink.cmp",
		"folke/snacks.nvim",
	},
	config = function()
		local ok, render_md = pcall(require, "render-markdown")
		if ok then
			render_md.setup({
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			})
		end

		require("opencode").setup({})
	end,
}
