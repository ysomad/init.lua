return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'pyright',
        'tsserver',
        'bashls',
        'gopls',
        'dockerls',
        'docker_compose_language_service',
        'yamlls',
      },
      automatic_installation = true
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter

        "gofumpt", -- go better gofmt
        { "gotests", version = "develop" }, -- go tests codegen
        "golangci-lint",
      }
    })
  end
}
