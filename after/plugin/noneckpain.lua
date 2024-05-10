local neckPain = require("no-neck-pain")

neckPain.setup({
  killAllBuffersOnDisable = true,
  width = 120,
  autocmds = {
    enableOnVimEnter = true,
    enableOnTabEnter = true,
  }
})

-- Toggle neckpain
vim.keymap.set('n', '<Space>np', ':NoNeckPain<Enter>', { silent = true })
vim.keymap.set('n', '<Space>nu', ':NoNeckPainWidthUp<Enter>', { silent = true })
vim.keymap.set('n', '<Space>nn', ':NoNeckPainWidthDown<Enter>', { silent = true })
