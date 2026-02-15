local vim = vim
local Plug = vim.fn['plug#']

-- VIM Plug plugin list
vim.call('plug#begin')

-- Theme
Plug('catppuccin/nvim')

-- nvim-tree
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')

-- Tabs
Plug('romgrk/barbar.nvim')

-- Status bar
Plug('nvim-lualine/lualine.nvim') 

vim.call('plug#end')

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. home .. "/.config/nvim/settings/?.lua;" .. package.path

-- Settings
require "common"
require "theme"
-- Plugins
require "vimtree"
require "barbar"
require "lua_line"
