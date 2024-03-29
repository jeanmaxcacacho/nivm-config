-- editor basics
vim.opt.number = true
vim.opt.relativenumber = true

-- fundamental keymaps
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>pv', ':Explore<CR>', { noremap = true, silent = true })
