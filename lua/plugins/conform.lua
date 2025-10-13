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
			go = { "gofumpt", "goimports", "gci", "golines" },
			sql = { "pg_format" },
		},
		formatters = {
			gci = {
				inherit = false,
				stdin = false,
				command = "gci",
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
			golines = { args = { "-m", "120" } },
		},
		format_on_save = function(bufnr)
			local bufname = vim.api.nvim_buf_get_name(bufnr)

			-- disable formatting for generated files
			if bufname:match("/gen/") then
				return
			end

			return { timeout_ms = 2500, lsp_format = "fallback" }
		end,
	},
}
