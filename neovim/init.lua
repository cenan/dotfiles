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

require("config/options")
require("config/keymaps")
require("config/mini")


vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('pyright')

vim.pack.add({
  {
    src = "https://www.github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19.0.0")
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter"
})

require("codecompanion").setup({
  interactions = {
    chat = {
      keymaps = {
        close = false,
        clear = false,
      },
      adapter = {
        name = "mistral_vibe" -- "codex"
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

vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

--require('nvim-treesitter').install { 'yaml' }

