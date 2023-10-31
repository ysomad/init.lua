local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.set_sign_icons({
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
})

vim.diagnostic.config { virtual_text = true }

lsp_zero.on_attach(function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end)

lsp_zero.setup()