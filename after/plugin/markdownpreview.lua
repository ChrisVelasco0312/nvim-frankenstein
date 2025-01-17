-- invoke command: MarkdownPreviewToggle and bind to the Leader mp key

vim.keymap.set('n', '<leader>mp', function()
  vim.cmd('MarkdownPreviewToggle')
end, { noremap = true, silent = true, desc = 'Toggle Markdown Preview' })
