require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "<C-s>", "<ESC> <cmd> w <cr>")
map("n", "zz", "<cmd> w <cr>")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_u_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
map("n", "<C-m>", "<C-i>", opts)

-- New tab
map("n", "te", ":tabedit")
-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)
-- Move window
map("n", "<S-Left>", "<C-w>h")
map("n", "<S-Up>", "<C-w>k")
map("n", "<S-Down>", "<C-w>j")
map("n", "<S-Right>", "<C-w>l")

-- Resize window
map("n", "<C-left>", "<C-w><")
map("n", "<C-right>", "<C-w>>")
map("n", "<C-up>", "<C-w>+")
map("n", "<C-down>", "<C-w>-")

-- Diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

map("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)

map("n", "<leader>i", function()
  require("craftzdog.lsp").toggleInlayHints()
end)

map({ "n", "i", "v" }, "<C-c>", '"*y')
map("i", "jk", "<ESC>")
