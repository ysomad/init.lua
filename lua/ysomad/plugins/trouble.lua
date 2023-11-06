return {
  'folke/trouble.nvim',
  config = function ()
    require('trouble').setup {
      icons = false
    }
  end
}