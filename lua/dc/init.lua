local M = {}

M.config = {
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "dc"

  for group, opts in pairs(require("dc.groups").setup(M.config)) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local c = require("dc.palette")
  local terminal = {
    c.background, c.red, c.green, c.yellow,
    c.purple, c.pink, c.cyan, c.foreground,
    c.comment, c.red, c.green, c.yellow,
    c.purple, c.pink, c.cyan, c.foreground,
  }

  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
