require("oil").setup({
  default_file_explorer = true,
  float = {
    max_width = 100,
    max_height = 40,
  },
  view_options = {
    show_hidden = true
  }
})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- open in floating window
vim.keymap.set("n", "sf", require("oil").open_float, { desc = "Open parent directory in floating window" })

--close with q
vim.keymap.set("n", "q", require("oil").close, { desc = "Close oil" })
