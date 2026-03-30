vim.g.copilot_enabled = false
vim.g.have_nerd_font = true

local opt = vim.opt
local default_background = "dark"
local default_colorscheme = "habamax"

opt.background = default_background

local colorscheme_ok = pcall(vim.cmd.colorscheme, default_colorscheme)
if not colorscheme_ok then
  vim.notify("Default colorscheme not found: " .. default_colorscheme, vim.log.levels.WARN)
end

-- Optional local overrides in ~/.config/nvim/lua/local.lua
local local_lua_path = vim.fn.stdpath("config") .. "/lua/local.lua"
if vim.fn.filereadable(local_lua_path) == 1 then
  package.loaded["local"] = nil
  local local_ok, local_err = pcall(require, "local")
  if not local_ok then
    vim.notify("Failed to load local.lua: " .. local_err, vim.log.levels.WARN)
  end
end
--vim.cmd.colorscheme('miniautumn')
--vim.cmd.colorscheme('minischeme')

vim.cmd("let g:netrw_liststyle = 3")

opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true -- if mixed case is searched, assume case-insensitive

opt.cursorline = true
opt.showmode = false -- do not show the mode, instead it is in status line

opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that the text won't shift

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- use the system clipboard as the default register

local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
if ok then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end

