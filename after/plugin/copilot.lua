-- disable codeium by default
vim.keymap.set('n', ';cc', ':Copilot enable<ENTER>', { silent = true, desc = 'Copilot Enable' })
-- enable copilot
vim.keymap.set('n', ';cd', ':Copilot disable<ENTER>', {
  silent = true, desc = 'Copilot Disable'
})
