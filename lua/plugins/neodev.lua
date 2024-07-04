return {
  "folke/neodev.nvim",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  opts = {},
  config = function ()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
  end
}

