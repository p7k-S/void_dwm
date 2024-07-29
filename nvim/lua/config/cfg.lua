--vim.cmd("")
vim.cmd("set encoding=utf-8")
vim.cmd("set noswapfile")
vim.cmd("set nocompatible")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set colorcolumn=80")
vim.cmd("set laststatus=0")

vim.cmd("set noshowmode")

vim.cmd("set scrolloff=5")

-- vim.cmd("set clipboard=unnamedplus")

-- без переноса строки
vim.cmd("set nowrap")

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50  -- wtf?????
