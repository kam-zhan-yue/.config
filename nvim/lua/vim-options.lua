vim.cmd("set expandtab")
vim.cmd("set tabstop=1")
vim.cmd("set softtabstop=1")
vim.cmd("set shiftwidth=1")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "tj", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tk", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tq", ":bd<CR>", { noremap = true, silent = true })

-- vim.opt.relativenumber = true
vim.opt.number = true
