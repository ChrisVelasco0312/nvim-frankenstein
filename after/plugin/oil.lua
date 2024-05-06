require("oil").setup({
  default_file_explorer = true,
  float = {
    max_width = 100,
    max_height = 40,
  }
})


-- Keymaps
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "sf", require("oil").open_float, { desc = "Open parent directory in floating window" })
