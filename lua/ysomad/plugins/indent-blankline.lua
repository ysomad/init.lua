return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function ()
    require("ibl").setup({
      indent = { char = "▏" },
      scope = { enabled = false },
      whitespace = { remove_blankline_trail = false },
    })
  end
}
