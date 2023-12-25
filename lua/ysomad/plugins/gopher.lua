return {
  "ysomad/gopher.nvim",
  branch = "develop",
  config = function ()
    require("gopher").setup({
      gotests = {
        template = "testify",
        named = true
      }
    })
  end
}
