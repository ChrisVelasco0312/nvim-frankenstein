local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  },
  symbol_in_winbar = {
    enable = false
  }
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>',
  { noremap = true, silent = true, desc = '[saga] go to next diagnostic message' })
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', {
  noremap = true, silent = true, desc = '[saga] show line diagnostic'
})
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', {
  noremap = true, silent = true, desc = '[saga] show documentation for symbol'
})
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {
  noremap = true, silent = true, desc = '[saga] show signature help'
})
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', {
  noremap = true, silent = true, desc = '[saga] show definition'
})
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', {
  noremap = true, silent = true, desc = '[saga] rename symbol'
})

-- code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
