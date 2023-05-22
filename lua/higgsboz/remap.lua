vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Copies to the main clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- remaps going forward and backward in buffer list
vim.keymap.set("n", "<C-n>", function()
	vim.cmd("bn")
end, { remap = true })

vim.keymap.set("n", "<C-p>", function()
	vim.cmd("bp")
end)

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("bw")
	vim.cmd("b#")
end)

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

print(vim.api.nvim_list_bufs())
