return {
	"ysomad/gopher.nvim",
	branch = "main",
	config = function()
		require("gopher").setup({
			gotests = {
				template = "testify",
			},
		})
	end,
}
