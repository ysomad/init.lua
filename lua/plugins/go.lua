return {
	"olexsmir/gopher.nvim",
	branch = "develop",
	config = function()
		require("gopher").setup({
			gotests = {
				template = "testify",
			},
		})
	end,
}
