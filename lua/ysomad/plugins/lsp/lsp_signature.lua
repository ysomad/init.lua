return {
  'ray-x/lsp_signature.nvim',
  event = "VeryLazy",
  config = function ()
    require('lsp_signature').setup({
      floating_window = false,
      hint_prefix = ""
    })
  end
}
