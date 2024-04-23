-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Jump to start/end of line
vim.keymap.set("n", "<leader>h", "<Home>", { remap = true })
vim.keymap.set("n", "<leader>l", "<End>", { remap = true })
vim.keymap.set("v", "<leader>h", "<Home>", { remap = true })
vim.keymap.set("v", "<leader>l", "<End>", { remap = true })

-- Move pages (screens) up/down
vim.keymap.set("n", "<leader>j", "<C-f>")
vim.keymap.set("n", "<leader>k", "<C-b>")

-- LSP key bindings
vim.keymap.set(
	"n",
	"<leader>fd",
	vim.lsp.buf.definition,
	{ noremap = true, silent = true, desc = "Symbol definition" }
)
vim.keymap.set(
	"n",
	"<leader>fi",
	vim.lsp.buf.implementation,
	{ noremap = true, silent = true, desc = "Symbol implementation" }
)

-- Open Neotree floating
vim.keymap.set(
	"n",
	"<leader>p",
	":Neotree reveal<CR>",
	{ noremap = true, desc = "Reveal buffer in file explorer" }
)
