return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPost",
	opts = {
		separator = "-",
	},
	config = function(_, opts)
		require("treesitter-context").setup(opts)
		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
	end,
}
