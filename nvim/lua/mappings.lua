require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

--- navigation windows
map("n", "wh", "<C-w>h")
map("n", "wj", "<C-w>j")
map("n", "wk", "<C-w>k")
map("n", "wl", "<C-w>l")

