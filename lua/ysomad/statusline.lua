local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "E:" .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " W:" .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " H:" .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " I:" .. count["info"]
  end

  return errors .. warnings .. hints .. info
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

M = {}

function M.setup()
  return table.concat({
    "%#Statusline#",
    "%#Normal# ",
    filepath(),
    filename(),
    lsp(),
    "%=%#StatusLineExtra#",
    vim.bo.filetype,
    " %p %l:%c ",
  })
end

return M
