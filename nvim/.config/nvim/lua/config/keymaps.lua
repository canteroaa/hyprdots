-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- borra todo lo de la linea posicionado antes del cursor
--map("n", "dw", "vb_d")

-- Esc insert mode
map("i", "jk", "<Escape>", opts)
map("i", "kj", "<Escape>", opts)

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Jumplist
--map("n", "<C-m>", "<C-i>", opts)

-- New Tab
map("n", "te", "<cmd>tabedit<cr>", { desc = "New Tab" })
-- map("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<s-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- buffers
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "tw", "<cmd>bdelete<cr>", { desc = "Next buffer" })

-- split windows
map("n", "<leader>wv", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>ws", "<C-W>v", { desc = "Split window right", remap = true })

-- Diagnostic
map("n", "<M-m>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Neogit keymap
map("n", "<leader>n", "<Cmd>Neogit<CR>", { desc = "Neogit" })

-- keymap para reemplazar todas las palabras de un archivo
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace a Word" })

-- Notes for each project
map("n", "<leader>m", "<cmd>Flote<CR>", { desc = "Notas", noremap = true })

-- don't copy to clipboard when press "x" for delete a character
map("n", "x", '"_x')

-- past with P save in diferent buffer
map("x", "<leader>p", [["_dP]], { desc = "Super Paste" })

map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
-- map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
-- map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- delete without save in clipboard
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Super Delete" })

-- obsidian open current note in app
map("n", "<leader>oo", "<Cmd>ObsidianOpen<CR>", { desc = "Open Obsidian Current File" })

-- Center ctrl+u , ctrl+d
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
