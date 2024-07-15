vim.cmd "colorscheme everforest"

vim.keymap.set({"t", "v", "i"}, "<C-Space>", "<C-Bslash><C-n>")


------ window managment


--- navigation
vim.keymap.set("n", "wh", "<C-w>h")
vim.keymap.set("n", "wj", "<C-w>j")
vim.keymap.set("n", "wk", "<C-w>k")
vim.keymap.set("n", "wl", "<C-w>l")


--- split 
vim.keymap.set("n", "ws", function() vim.cmd.split("term://bash")end)
vim.keymap.set("n", "wv", function() vim.cmd.vsplit("term://bash")end)

--- resize 
vim.keymap.createMode("RESIZE WINDOW", "r")

vim.keymap.set("r", "k", function() vim.cmd "resize +1" end)
vim.keymap.set("r", "j", function() vim.cmd "resize -1" end)
vim.keymap.set("r", "h", function() vim.cmd "vertical resize -1" end)
vim.keymap.set("r", "l", function() vim.cmd "vertical resize +1" end)
