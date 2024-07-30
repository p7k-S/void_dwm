vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

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

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

--Lsp
vim.keymap.set("n", "<leader>]", ":LspStop<CR>")
vim.keymap.set("n", "<leader>[", ":LspStart<CR>")
