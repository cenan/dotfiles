-- Set leader key: space on Termux (Android), comma elsewhere
if vim.fn.has("android") == 1 then
    vim.g.mapleader = " "
else
    vim.g.mapleader = ","
end

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "//", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Move to next buffer" })
keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Move to previous buffer" })
keymap.set("n", "<C-p>", function() MiniPick.builtin.files() end, { desc = "Pick files" })
--keymap.set("n", "<leader>pf", function() MiniFiles.open() end, { desc = "Open MiniFiles" })
keymap.set("n", "<leader>pc", function() MiniExtra.pickers.colorschemes({ preview_hl_groups = {} }) end, { desc = "Color Schemes" })
keymap.set("n", "<leader>pe", function() MiniExtra.pickers.explorer() end, { desc = "Open Explorer" })
keymap.set("n", "<leader>pd", function() MiniExtra.pickers.diagnostic() end, { desc = "Open Diagnostic" })
keymap.set("n", "<leader>ph", function() MiniExtra.pickers.history() end, { desc = "Open Command History" })
keymap.set("n", "<leader>pl", function() MiniExtra.pickers.lsp({ scope = 'references' }) end, { desc = "Open LSP" })
keymap.set("n", "<leader>pq", function() MiniExtra.pickers.list({ scope = "quickfix" }) end, { desc = "Quickfix" })
keymap.set("n", "<leader>pg", function() MiniPick.builtin.grep() end, { desc = "Grep" })
-- keymap.set("n", "<leader>pm", function() MiniExtra.pickers.manpages() end, { desc = "Man Pages" })
keymap.set("n", "<leader>pm", function() MiniExtra.pickers.marks() end, { desc = "Markers" })
keymap.set("n", "<leader>rr", function()
    vim.cmd("source $MYVIMRC")
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/config/options.lua")
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/config/keymaps.lua")
end, { desc = "Reload Neovim config" })
keymap.set("n", "<leader>c", ":CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanionChat" })
keymap.set("n", "<leader>gg", ":Neogit<cr>", { desc = "Open Neogit" })
keymap.set('n', '<leader>w', function()
    -- Check if the buffer has unsaved changes
    if vim.bo.modified then
        local choice = vim.fn.confirm("Buffer has unsaved changes. Save?", "&Yes\n&No\n&Cancel")
        if choice == 1 then
            vim.cmd('write')
            vim.cmd('bdelete')
        elseif choice == 2 then
            vim.cmd('bdelete!')
        end
    else
        vim.cmd('bdelete')
    end
end, { noremap = true, silent = true, desc = "Close buffer" })
keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, silent = true, desc = 'Rename symbol' })
keymap.set('n', '<F12>', vim.lsp.buf.definition, { noremap = true, silent = true, desc = 'Go to definition' })
keymap.set('n', '<leader>lf', vim.lsp.buf.format, { noremap = true, silent = true, desc = 'Format buffer' })
