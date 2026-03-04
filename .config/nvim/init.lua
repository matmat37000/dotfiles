-- VIM Plug Install
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

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

-- tree-sitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Auto complete
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

Plug('amarakon/nvim-cmp-buffer-lines')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- Snippets
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
Plug('saadparwaiz1/cmp_luasnip')


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
require("mason").setup()
require("mason-lspconfig").setup {
    automatic_enable = true,
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "jdtls", "pyright" }
}
require "lsp"
require "cmp-config"

-- Mapping
require "mapping"

-- nvim-tree
-- require("nvim-tree.api").tree.open()
