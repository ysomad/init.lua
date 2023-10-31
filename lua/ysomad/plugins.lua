local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'aktersnurra/no-clown-fiesta.nvim',
    config = function()
      require('no-clown-fiesta').setup({
        transparent = true
      })
      vim.cmd.colorscheme('no-clown-fiesta')
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'nvim-web-devicons',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  -- 'nvim-treesitter/nvim-treesitter-context',
  'mbbill/undotree',
  'nvim-lualine/lualine.nvim',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  'lukas-reineke/indent-blankline.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  },
  'ray-x/lsp_signature.nvim',
  'folke/trouble.nvim',
  'christoomey/vim-tmux-navigator',
})