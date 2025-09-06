---@type vim.lsp.Config
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", "go.work", ".git" },
	settings = {
		gopls = {
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-node_modules" },
			gofumpt = true,
		},
	},
}
