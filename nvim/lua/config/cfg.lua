vim.opt.guicursor = "i:hor1"

vim.g.netrw_banner = 0
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

-- без переноса строки
vim.cmd("set nowrap")

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"


-- highlight yanked text for 200ms using the "Visual" highlight group
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true
vim.on_key(function(char)
    if vim.fn.mode() == "n" then
        local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
        if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
    end
end, vim.api.nvim_create_namespace "auto_hlsearch")

-- vim.opt.updatetime = 50 -- wtf?????
