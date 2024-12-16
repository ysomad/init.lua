return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"yaml",
				"toml",
				"bash",
				"dockerfile",
				"vimdoc",
				"vim",
				"comment",

				"go",
				"gotmpl",
				"gomod",
				"gowork",
				"gosum",

				"lua",
				"python",
				"sql",
				"javascript",
				"typescript",
				"rust",
				"markdown",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
