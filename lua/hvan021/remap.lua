vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move the selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>p", [["_dP]]) -- replace current seleced lines with clipboard
vim.keymap.set("n", "x", [["_x]])          -- replace current seleced lines with clipboard
vim.keymap.set('n', '<leader>o', '[[:Oil <CR>]]')
-- vim.keymap.set('n', '<leader>ex', '[[:Neotree toggle current<CR>]]')
-- vim.keymap.set('n', '<leader>ex', '[[:Neotree toggle current reveal_force_cwd<CR>]]')

vim.keymap.set("n", "<leader>bd", ":bn | bd #<CR>")
vim.keymap.set("n", "<S-l>", ":bn<CR>")
vim.keymap.set("n", "<S-h>", ":bp<CR>")


-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
