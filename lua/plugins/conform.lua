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
			sql = { "pg_format" },
		},
		format_on_save = function(_)
			return {
				timeout_ms = 1500,
				lsp_fallback = true,
			}
		end,
	},
}
