vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', 'tj', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tk', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tq', ':bd<CR>', { noremap = true, silent = true })


