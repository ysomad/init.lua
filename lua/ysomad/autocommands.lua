local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ysomad_group = augroup('ysomad', {})
local yank_group = augroup('HighlightYank', {})
local statusline_group = augroup('StatusLine', {})

-- highlight on yank
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

--- remove all trailing whitespace on save
autocmd('BufWritePre', {
  group = ysomad_group,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt.fo:remove('c')
    vim.opt.fo:remove('r')
    vim.opt.fo:remove('o')
  end
})

-- 2 spaces for selected filetypes
autocmd('FileType', {
  pattern = 'xml,html,xhtml,css,scss,javascript,yaml,htmljinja',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})

-- go: format and organize imports on save
autocmd('BufWritePre', {
  pattern = { '*.go' },
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

-- custom statusline
-- autocmd({"WinEnter", "BufEnter"}, {
--   group = statusline_group,
--   pattern = "*",
--   command = [[setlocal statusline=%!v:lua.require('ysomad.statusline').setup()]]
-- })
