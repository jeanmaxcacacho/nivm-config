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

-- this is where to install the plugins
require('lazy').setup({
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "python", "java", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
})

-- configuring telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
