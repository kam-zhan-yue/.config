vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set mouse=")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.lazyvim_rust_diagnostics = "bacon-ls"

-- vim.keymap.set("n", "tj", ":bprev<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "tk", ":bnext<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "tq", ":bd<CR>", { noremap = true, silent = true })

-- vim.opt.relativenumber = true
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.number = true
