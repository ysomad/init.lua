return {
  {
    -- 'aktersnurra/no-clown-fiesta.nvim',
    "ysomad/no-clown-fiesta.nvim",
    priority = 1000,
    config = function()
      require("no-clown-fiesta").setup()
      vim.cmd.colorscheme("no-clown-fiesta")
    end
  }

  -- "nyoom-engineering/oxocarbon.nvim",
  -- priority = 1000,
  -- config = function()
  --   -- vim.cmd.colorscheme('no-clown-fiesta')
  --   vim.cmd.colorscheme('oxocarbon')
  -- end
}
