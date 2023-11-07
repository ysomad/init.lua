return {
  "olexsmir/gopher.nvim",
  config = true,
  build = function ()
    vim.cmd(':GoInstallDeps')
  end
}
