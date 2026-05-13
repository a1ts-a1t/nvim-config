vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = false;
            },
        },
    },
})

vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('rust_analyzer')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        })

        if client:supports_method('textDocument/publishDiagnostics') then
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
            })

            vim.keymap.set("n", "?", vim.diagnostic.open_float, { desc = "Show diagnostics" })
        end
    end,
})
