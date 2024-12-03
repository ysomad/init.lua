return {
	"olexsmir/gopher.nvim",
	branch = "develop",
	config = function()
		-- hardcode since mason tool installer doesnt work with develop branch
		vim.fn.jobstart("go install github.com/cweill/gotests/...@develop")

		require("gopher").setup({
			commands = { gotests = "/Users/ysomad/go/bin/gotests" },
			gotests = {
				template = "testify",
				named = true,
			},
		})
	end,
}
