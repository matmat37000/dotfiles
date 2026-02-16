local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts)

        opts.desc = "Go to declaration"
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

        opts.desc = "See available code actions"
        keymap.set({ 'n', 'v' }, '<A-Enter>', vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        opts.desc = "Show line diagnostics"
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        opts.desc = "Show documentation for what is under"
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.HINT] = " 󰠠",
            [severity.INFO] = " ",
        },
    },
})

