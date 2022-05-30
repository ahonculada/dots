local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- Normal mode = "n",
-- Insert mode = "i",
-- Visual mode = "v",
-- Visual Line mode = "V",
-- Visual Block mode = "x",
-- Terminal mode = "t",
-- Command mode = "c",


-- NORMAL --
-- =================================================

-- Save file
keymap("n", "<leader>w", ":w<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Resize with arrows
-- DOES NOT WORK FOR MAC
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical +2<CR>", opts)

-- Toggle Terminal
keymap("n", "<leader>t", ":term<CR>", opts)

-- turn off search highlighting
keymap("n", "<CR>", ":nohlsearch<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Remap ; to :
keymap("n", ";", ":", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- keep line centered on search/join
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Diasable annoying keys
keymap("n", "<c-z>", "<Nop>", opts)
keymap("n", "Q", "<Nop>", opts)

-- INSERT --
-- =================================================
-- Leave insert mode
keymap("i", "<C-k>", "<Esc>", opts)

-- VISUAL --
-- =================================================
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Leave visual mode
keymap("v", "<C-k>", "<Esc>", opts)




