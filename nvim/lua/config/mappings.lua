vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n" ,"<c-up>",   "<c-w>+")
vim.keymap.set("n" ,"<c-down>", "<c-w>-")
vim.keymap.set("n" ,"<c-left>", "<c-w>>")
vim.keymap.set("n" ,"<c-right>","<c-w><")

vim.keymap.set("n", "<Tab>",   ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bp<CR>")
vim.keymap.set("n", "<leader>x", "<esc>:w<CR>:bd<CR>")

-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

--Lsp
vim.keymap.set("n", "<leader>]", ":LspStop<CR>")
vim.keymap.set("n", "<leader>[", ":LspStart<CR>")

-- get path and name of file
vim.keymap.set("n", "<leader>ff", ":file<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
