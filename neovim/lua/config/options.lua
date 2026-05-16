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

-- local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
-- if ok then
--   vim.g.clipboard = {
--     name = "OSC 52",
--     copy = {
--       ["+"] = osc52.copy("+"),
--       ["*"] = osc52.copy("*"),
--     },
--     paste = {
--       ["+"] = osc52.paste("+"),
--       ["*"] = osc52.paste("*"),
--     },
--   }
-- end

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- Extra arguments to pass to aws s3 when creating/deleting/moving/copying files using aws s3
  extra_s3_args = {},
  -- Configuration for the floating SSH window
  ssh = {
    border = nil,
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = nil,
  },
})



