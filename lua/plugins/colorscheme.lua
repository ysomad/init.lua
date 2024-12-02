return {
	"aktersnurra/no-clown-fiesta.nvim",
	priority = 1000,
	config = function()
		require("no-clown-fiesta").setup()
		vim.cmd.colorscheme("no-clown-fiesta")
	end,
}

-- return {
-- 	"slugbyte/lackluster.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	init = function()
-- 		-- vim.cmd.colorscheme("lackluster")
-- 		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
-- 		-- vim.cmd.colorscheme("lackluster-mint")
-- 	end,
-- }
