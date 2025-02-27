local obsidian = require('obsidian')

obsidian.setup({
  workspaces = {
    {
      name = "vaults",
      path = "~/cristian-linux/vaults",
    },
  }
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.bo.textwidth = 80
    vim.bo.formatoptions = vim.bo.formatoptions .. "t"
  end,
})

-- Function to rearrange selected lines
local function rearrange_lines(opts)
  -- Get the character limit from the command arguments (default to 80 if not provided)
  local char_limit = tonumber(opts.args) or 80

  -- Get the start and end lines of the visual selection
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Get the selected lines as a list
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Join the lines into a single string
  local text = table.concat(lines, " ")

  -- Split the text into words
  local words = vim.split(text, " ")

  -- Initialize variables
  local result = {}
  local current_line = ""

  -- Build lines while respecting the character limit
  for _, word in ipairs(words) do
    if #current_line + #word + 1 <= char_limit then
      -- Add the word to the current line
      if current_line ~= "" then
        current_line = current_line .. " " .. word
      else
        current_line = word
      end
    else
      -- Finalize the current line and start a new one
      if current_line ~= "" then
        table.insert(result, current_line)
      end
      current_line = word
    end
  end

  -- Add the last line if it's not empty
  if current_line ~= "" then
    table.insert(result, current_line)
  end

  -- Ensure no single word is left alone on a line
  local i = 1
  while i < #result do
    if #vim.split(result[i], " ") == 1 then
      -- Merge the single-word line with the next line
      result[i] = result[i] .. " " .. result[i + 1]
      table.remove(result, i + 1)
    else
      i = i + 1
    end
  end

  -- Replace the selected lines with the rearranged lines
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result)
end

-- Define a custom command to call the function
vim.api.nvim_create_user_command("RearrangeLines", rearrange_lines, {
  range = true, -- Allows the command to work on selected lines
  nargs = "?",  -- Accepts an optional argument (character limit)
  desc = "Rearrange selected lines to fit within a character limit, ensuring no single word is left alone.",
})

local function lazy_load_markdown()
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()

  -- Get the range of visible lines
  local first_line = vim.fn.line('w0')
  local last_line = vim.fn.line('w$')

  -- Read the visible lines from the file
  local lines = vim.api.nvim_buf_get_lines(buf, first_line - 1, last_line, false)

  -- Clear the buffer and set the visible lines
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

-- Set up an autocommand to update on scroll
vim.api.nvim_create_autocmd('WinScrolled', {
  pattern = '*.md',
  callback = lazy_load_markdown,
})

-- Initial load
lazy_load_markdown()
