return {
  'aktersnurra/no-clown-fiesta.nvim',
  priority = 1000,
  config = function()
    -- require("no-clown-fiesta").setup()
    vim.cmd.colorscheme("togglebit")
  end
}
