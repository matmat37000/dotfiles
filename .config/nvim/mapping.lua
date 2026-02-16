vim.g.mapleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic

-- Tab switching
map('n', '<A-Up>', '<cmd>BufferPrevious<cr>', opts)
map('n', '<A-Down>', '<cmd>BufferNext<cr>', { silent = true})
-- -- Re-order
map('n', '<S-A-Up>', '<cmd>BufferMovePrevious<cr>', opts)
map('n', '<S-A-Down>', '<cmd>BufferMoveNext<cr>', opts)
-- -- Go-to
map('n', '<A-1>', '<cmd>BufferGoto 1<cr>', opts)
map('n', '<A-2>', '<cmd>BufferGoto 2<cr>', opts)
map('n', '<A-3>', '<cmd>BufferGoto 3<cr>', opts)
map('n', '<A-4>', '<cmd>BufferGoto 4<cr>', opts)
map('n', '<A-5>', '<cmd>BufferGoto 5<cr>', opts)
map('n', '<A-6>', '<cmd>BufferGoto 6<cr>', opts)
map('n', '<A-7>', '<cmd>BufferGoto 7<cr>', opts)
map('n', '<A-8>', '<cmd>BufferGoto 8<cr>', opts)
map('n', '<A-9>', '<cmd>BufferGoto 9<cr>', opts)
map('n', '<A-0>', '<cmd>BufferLast<cr>', opts)
-- -- Pin Buffer
map('n', '<A-p>', '<cmd>BufferPin<cr>', opts)
-- -- Close buffer
map('n', '<A-w>', '<cmd>BufferClose<cr>', opts)
map('n', '<A-t>', '<cmd>BufferRestore<cr>', opts)

-- Split pan switch
map('n', '<A-Left>', '<cmd>wincmd h<cr>', opts)
map('n', '<A-Right>', '<cmd>wincmd l<cr>', opts)


-- nvim-tree
map('n', '<C-b>', require("nvim-tree.api").tree.toggle, opts)

