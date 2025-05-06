local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		-- "rcarriga/nvim-dap-ui",

		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup({
			-- library = {
			--   plugins = { "nvim-dap-ui" },
			--   types = true,
			-- },
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			yamlls = true,
			lua_ls = true,
			pyright = {
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								["reportOptionalMemberAccess"] = "none",
							},
						},
					},
				},
			},
			ts_ls = true,
			dockerls = true,
			docker_compose_language_service = true,
			rust_analyzer = true,
			gopls = {
				settings = {
					gopls = {
						directoryFilters = { "-.git", "-node_modules", "-**/go/pkg/mod" },
						buildFlags = { "-tags=integration", "-tags=migrate" },

						staticcheck = true,
						gofumpt = true,

						codelenses = {
							generate = true,
							run_govulncheck = true,
						},

						analyses = {
							unusedvariable = true,
							unusedparams = true,
							fieldalignment = false, -- DEPRECATED
							useany = true,
						},
					},
				},
			},
			golangci_lint_ls = {
				cmd = { "golangci-lint-langserver" },
				root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
				init_options = {
					command = {
						"golangci-lint",
						"run",
						"--output.json.path",
						"stdout",
						"--show-stats=false",
						"--issues-exit-code",
						"1",
					},
				},
				settings = {
					golangci_lint_ls = { filetypes = { "go", "gomod" } },
				},
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup()

		local ensure_installed = {
			-- servers
			"bashls",
			"yamlls",
			"lua_ls",
			"pyright",
			"ts_ls",
			"gopls",
			"golangci_lint_ls",
			"dockerls",
			"docker_compose_language_service",

			-- formatters
			"stylua", -- lua
			"black", -- python
			"isort", -- python
			"taplo", -- toml
			"yamlfix", -- yaml
			"gofumpt", -- go
			"gci", -- go
			"beautysh", -- bash
			"buf",

			-- cli
			"delve", -- debug
			"gotests",
		}

		vim.list_extend(ensure_installed, servers_to_install)

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "List LSP references" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "List LSP definitions" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "List LSP declarations" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "List LSP implementations" })
				vim.keymap.set(
					"n",
					"gt",
					vim.lsp.buf.type_definition,
					{ buffer = 0, desc = "List LSP type definitions" }
				)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show documentation under cursor" })

				-- actions
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Smart rename" })
				vim.keymap.set(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ buffer = 0, desc = "Show available code actions" }
				)

				-- diagnostics
				vim.keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ buffer = 0, desc = "Open diagnostic in float window" }
				)
				vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { buffer = 0, desc = "Goto next error" })
				vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { buffer = 0, desc = "Goto prev error" })
				vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { buffer = 0, desc = "Goto next warning" })
				vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { buffer = 0, desc = "Goto prev warning" })

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})
	end,
}
