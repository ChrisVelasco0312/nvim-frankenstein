local trouble = require('trouble')

trouble.setup {
  icons = false,
  mode = 'lsp_hover_diagnostics'
}

vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>TroubleToggle workspace_diagnostics<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lo', '<cmd>TroubleToggle document_diagnostics<CR>',
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>TroubleToggle todo<CR>',
  { noremap = true, silent = true, desc = '[T]rouble To[D]o' })
