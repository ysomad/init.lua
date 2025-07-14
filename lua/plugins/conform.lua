return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_no_formatters = false,
		formatters_by_ft = {
			bash = { "beautysh" },
			yaml = { "yamlfix" },
			toml = { "taplo" },
			lua = { "stylua" },
			proto = { "buf" },
			python = { "isort", "black" },
			go = { "goimports", "gci", "gofumpt" },
			sql = { "pg_format" },
		},
		formatters = {
			gci = {
				inherit = false,
				command = "gci",
				stdin = false,
				args = {
					"write",
					"-s",
					"standard",
					"-s",
					"default",
					"-s",
					"localModule",
					"--skip-generated",
					"--skip-vendor",
					"$FILENAME",
				},
			},
		},
		format_on_save = function(bufnr)
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			-- disable formatting for generated files
			if bufname:match("/gen/") then
				return
			else
				return {
					timeout_ms = 7000,
					lsp_fallback = true,
				}
			end
		end,
	},
}
