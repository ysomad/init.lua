vim.lsp.enable({
	"lua_ls",
	"gopls",

	-- "pyright",
	-- "ts_ls",

	-- "rust_analyzer",
	-- "kotlin_lsp",

	-- "golangci_lint_ls",
	--
	-- "bashls",
	-- "yamlls",
	-- "dockerls",
	-- "docker_compose_language_service",
})

vim.diagnostic.config({
	virtual_lines = true,
	-- virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
