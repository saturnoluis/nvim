-- Install Packer                          🐕
-- ******************************************

local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'

   -- Color schemes
   use 'navarasu/onedark.nvim'
   use 'ellisonleao/gruvbox.nvim'

   -- Statusline
   use {
      'nvim-lualine/lualine.nvim'
   }

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
      require('packer').sync()
   end
end)


-- Set custom configurations               🐕
-- ******************************************

-- Map leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Display line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable cursorline
vim.opt.cursorline = true

-- Insert spaces instead of tabs
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Show white spaces
vim.opt.list = true

-- Autoread changes in opened files
vim.opt.autoread = true

-- Set automatic wrapping and new line
vim.cmd([[setlocal textwidth=80]])
vim.cmd([[setlocal wrap]])
vim.cmd([[setlocal formatoptions+=n]])

-- Set default color scheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd([[colorscheme gruvbox]])


-- Set custom keymaps                      🐕
-- ******************************************

-- Handy scape with double semi-colon
vim.keymap.set('i', '::', '<ESC>')

-- [C]lear [H]ighlights
vim.keymap.set('n', '<leader>ch', ':nohlsearch<CR>')


-- Set plugins config                     🐕
-- *****************************************

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
