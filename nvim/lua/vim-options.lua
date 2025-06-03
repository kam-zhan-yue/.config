vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "tj", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tk", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tq", ":bd<CR>", { noremap = true, silent = true })

vim.opt.relativenumber = true
