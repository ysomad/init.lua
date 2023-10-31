-- Here is where you configure the autocompletion settings.
local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    })
})