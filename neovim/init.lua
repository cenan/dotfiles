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

local gh = function(x) return 'https://github.com/' .. x end

-- vim.pack.add( { "https://github.com/alexmozaidze/palenight.nvim" } )
vim.pack.add( { gh("folke/tokyonight.nvim") } )

require("config/mini")


vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('pyright')
vim.lsp.enable('solargraph')
vim.lsp.enable('tailwindcss')

if vim.fn.has("android") ~= 1 then
  -- skip agentic.nvim on termux
  vim.pack.add({
    {
      src = gh("carlos-algms/agentic.nvim")
    }
  })
  require("agentic").setup({
    -- provider = "opencode-acp",
    provider = "mistral-vibe-acp",
  })
end

vim.pack.add({
  {
    src = gh('nvim-neo-tree/neo-tree.nvim'),
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",

  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

--require('nvim-treesitter').install { 'yaml' }
vim.pack.add({
  {
    src = gh('stevearc/oil.nvim.git')
  }
})

require("config/options")
require("config/keymaps")
