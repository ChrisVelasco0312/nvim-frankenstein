local ts = require('typescript-tools')

ts.setup {
  disable_commands = false,
}

-- vim.keymap.set('n', '<leader>oi', ':TSToolsOrganizeImports<CR>', {
--   noremap = true, silent = true, desc = '[O]rganize [I]mports'
-- })

-- Function to create a floating window with numbered TSTools commands
local function show_tstools_menu()
  local commands = {
    { cmd = "TSToolsOrganizeImports",      desc = "sorts and removes unused imports" },
    { cmd = "TSToolsSortImports",          desc = "sorts imports" },
    { cmd = "TSToolsRemoveUnusedImports",  desc = "removes unused imports" },
    { cmd = "TSToolsRemoveUnused",         desc = "removes all unused statements" },
    { cmd = "TSToolsAddMissingImports",    desc = "adds imports for all statements" },
    { cmd = "TSToolsFixAll",               desc = "fixes all fixable errors" },
    { cmd = "TSToolsGoToSourceDefinition", desc = "goes to source definition" },
    { cmd = "TSToolsRenameFile",           desc = "rename current file and update references" },
    { cmd = "TSToolsFileReferences",       desc = "find files that reference current file" }
  }

  -- Create numbered display lines
  local display_lines = {}
  for i, command in ipairs(commands) do
    table.insert(display_lines, string.format("%d. %s - %s", i, command.cmd, command.desc))
  end

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Calculate dimensions
  local width = 80
  local height = #commands

  -- Set buffer lines
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, display_lines)

  -- Open window near cursor
  local opts = {
    relative = 'cursor',
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded'
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Make buffer non-modifiable
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- Add number mappings to execute commands
  local opts_map = { buffer = buf, silent = true }
  for i, command in ipairs(commands) do
    vim.keymap.set('n', tostring(i), function()
      vim.api.nvim_win_close(win, true)
      vim.cmd(command.cmd)
    end, opts_map)
  end

  -- Add mapping to close window with q or Esc
  vim.keymap.set('n', 'q', function() vim.api.nvim_win_close(win, true) end, opts_map)
  vim.keymap.set('n', '<Esc>', function() vim.api.nvim_win_close(win, true) end, opts_map)
end

-- Bind to a key
vim.keymap.set('n', '<Leader>tc', show_tstools_menu, { noremap = true, silent = true })
