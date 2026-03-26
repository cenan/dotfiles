require("config/options")
require("config/keymaps")

-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
require('mini.basics').setup()
require('mini.statusline').setup()
require('mini.clue').setup({
  triggers = {
    { mode = {'n', 'x'}, keys='<Leader>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = 'n', keys='[' },
    { mode = 'n', keys=']' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = "`" },
    { mode = 'n', keys = '<C-w>' },
  }
})
require('mini.tabline').setup()
require('mini.icons').setup({
  style = 'glyph'
})

local starter = require('mini.starter')
starter.setup({
  evaluate_single = true,
  items = {
    starter.sections.recent_files(5, false),
    starter.sections.recent_files(5, true),
    {
      name = 'Settings',
      action = 'edit' .. vim.fn.expand('~/.config/nvim/init.lua'),
      section = 'Config',
    },
    {
      name = 'Keymaps',
      action = 'edit' .. vim.fn.expand('~/.config/nvim/lua/config/keymaps.lua'),
      section = 'Config',
    },
    starter.sections.builtin_actions(),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builting actions' }),
    starter.gen_hook.padding(3, 2),
  },
})

require('mini.files').setup()
require('mini.git').setup()
require('mini.pick').setup()
require('mini.extra').setup()
require('mini.notify').setup()

vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')

require('mini.completion').setup()
require('mini.comment').setup()
require('mini.diff').setup({
  view = {
    --style = 'sign',
    --signs = { add = '+', change = '▒', delete = '-' },
  }
})

--require('nvim-treesitter').install { 'yaml' }

---
-- name = "codex"

require("codecompanion").setup({
  interactions = {
    chat = {
      keymaps = {
        close = false,
        clear = false,
      },
      adapter = {
        name = "mistral_vibe"
      },
    },
    cli = {
      agent = "codex",
      agents = {
        codex = {
          cmd = "codex",
          args = {},
          description = "Codex",
          provider = "terminal",
        },
      },
    },
  },
})


