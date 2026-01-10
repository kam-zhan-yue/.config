vim.lsp.enable({
  'clangd',
  'lua-ls',
  'ruff',
  'basedpyright',
  'ts-ls',
  'bash-ls',
  'gopls',
  'gdscript',
  -- 'rust-analyzer',
})

vim.lsp.config("roslyn", {})

vim.diagnostic.config({
  virtual_text = true,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("<leader>ff", vim.lsp.buf.format, "Format")

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Autocomplete
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_completion, event.buf) then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true, })
    end
  end,
})

-- Log Commands
vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
  desc = "Get all the lsp logs",
})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("silent checkhealth vim.lsp")
end, {
  desc = "Get all the information about all LSP attached",
})
-- }}}
