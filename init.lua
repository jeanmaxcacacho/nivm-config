-- editor basics
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard:append("unnamedplus")

-- fundamental keymaps
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>pv', ':Explore<CR>', { noremap = true, silent = true })

-- package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


