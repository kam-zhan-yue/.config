require("config.vim-config")
require("config.godot-config")
require("config.editorconfig")
require("core.lazy")
require("core.lsp")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
