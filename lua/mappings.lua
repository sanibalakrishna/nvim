require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w! <cr>")
map(
  "n",
  "<leader>gc",
  ":w<CR>:!g++ -std=c++17 % -o %:r && %:r < input.txt > output.txt<CR>",
  { noremap = true, silent = true }
)
map("n", "<leader>fr", ":lua require('utils').find_replace()<CR>", { noremap = true, silent = true })

map("n", "<leader>sv", "<cmd> vs <cr>", { noremap = true, silent = true, desc = "Vertical split" })

map("n", "<leader>sh", "<cmd> sp <cr>", { noremap = true, silent = true, desc = "Horizantal split" })

-- Key mapping to close the current split
map("n", "<leader>c", ":q<CR>", { noremap = true, silent = true, desc = "Close current split" })
