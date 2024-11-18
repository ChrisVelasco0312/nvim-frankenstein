local lspconfig = require('lspconfig')
-- local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["astro"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "astro" },
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})



local function filter_tsserver_diagnostics(_, result, ctx, config)
  if result.diagnostics == nil then
    return
  end
  -- ignore some tsserver diagnostics
  local idx = 1
  while idx <= #result.diagnostics do
    local entry = result.diagnostics[idx]
    -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
    if entry.code == 80001 then
      -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
      table.remove(result.diagnostics, idx)
    else
      idx = idx + 1
    end
  end
  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = filter_tsserver_diagnostics

local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end

setup_diags()

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(nil, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

--keymap for lsprestart
vim.keymap.set("n", "<leader>l", ":LspRestart<cr>", { silent = true, desc = '[l]sp restart' })
