return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPre", "BufNewFile" },
  build = ':TSUpdate',
  config = function ()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'json',
        'yaml',
        'bash',
        'dockerfile',
        'vimdoc',
        'vim',
        'go',
        'lua',
        'python',
        'sql',
        'javascript',
        'typescript',
        'markdown',
        'markdown_inline'
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
