--- C, C++ 
vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.enable('clangd')

-- Lua
vim.lsp.config.luals = {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json' },
  filetypes = { 'lua' },
}

vim.lsp.enable('luals')

