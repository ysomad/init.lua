return {
	"nvim-neotest/neotest",
	event = "LspAttach",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	config = function()
		local neotest = require("neotest")
		local neotest_golang_opts = {}

		neotest.setup({
			adapters = {
				require("neotest-golang")(neotest_golang_opts),
			},
		})

		vim.keymap.set("n", "<leader>tt", function()
			neotest.run.run()
		end, { desc = "Neotest run nearest test" })

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Neotest current file" })

		vim.keymap.set("n", "<leader>tts", function()
			neotest.run.stop()
		end, { desc = "Neotest stop" })

		vim.keymap.set("n", "<leader>to", function()
			neotest.output_panel.open()
		end, { desc = "Neotest open output" })

		vim.keymap.set("n", "<leader>ts", function()
			neotest.summary.toggle()
		end, { desc = "Neotest toggle summary" })
	end,
}
