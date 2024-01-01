vim.keymap.set('n', ';ce', ':CodeiumEnable<ENTER>', { silent = true, desc = 'Copilot Enable' })
vim.keymap.set('n', ';cd', ':CodeiumDisable<ENTER>', { silent = true, desc = 'Copilot Disable' })
vim.keymap.set('n', ';ci', ':Codeium<ENTER>', { silent = true, desc = 'Copilot suggestions' })
vim.keymap.set('i', '<C-,>', 'codeium#Accept("<CR>")', { expr = true, silent = true, desc = 'Accept Copilot suggestion' })
