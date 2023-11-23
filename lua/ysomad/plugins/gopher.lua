return {
  "ysomad/gopher.nvim",
  branch = "develop",
  build = function ()
    vim.cmd(':GoInstallDeps')
  end,
  config = function ()
    require("gopher").setup({
      gotests = {
        tag = "@develop",
        template = "testify",
        named = true
      }
    })
  end,
}

