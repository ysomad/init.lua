return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			bash = { "beautysh" },
			yaml = { "yamlfix" },
			toml = { "taplo" },
			lua = { "stylua" },
			proto = { "buf" },
			python = { "black", "isort" },
			go = { "gofumpt", "goimports" },
		},
		format_on_save = {
			timeout_ms = 1500,
			lsp_format = "fallback",
		},
	},
}
