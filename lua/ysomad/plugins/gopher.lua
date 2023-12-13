return {
  "ysomad/gopher.nvim",
  branch = "develop",
  build = function ()
    vim.cmd(":GoInstallDeps")
    vim.fn.jobstart("go install github.com/cweill/gotests/...@develop")
  end,
  config = function ()
    require("gopher").setup({
      gotests = {
        template = "testify",
        named = true
      }
    })
  end
}

