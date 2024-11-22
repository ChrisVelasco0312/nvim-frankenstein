local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = { "node_modules", ".git/" },
    path_display = {
      truncate = true
    },

  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true
    },
    live_grep = {
      hidden = true,
      no_ignore = true
    }
  }
}


telescope.load_extension("file_browser")
vim.keymap.set("n", ";l", ":e .<ENTER>", { silent = true, desc = '[l] look files' })

--Kickstart maps
pcall(require('telescope').load_extension, 'fzf')
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', ';/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>/', function()
  builtin.live_grep { search_dirs = { "%:p" } }
end, { noremap = true, silent = true, desc = '[/] Fuzzily search in current buffer' })

-- vim.keymap.set('n', '<leader>sf',
--   "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
--   {
--     desc = '[S]earch [F]iles',
--   })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = '[S]earch [R]eferences' })
vim.keymap.set('n', '<leader>sc', builtin.keymaps, { desc = '[S]earch [C]ommands' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "go to next diagnostic message" })
vim.keymap.set('n', ';e', vim.diagnostic.open_float, { desc = "open floating diagnostic message" })
vim.keymap.set('n', ';q', vim.diagnostic.setloclist, { desc = "open diagnostics list" })
