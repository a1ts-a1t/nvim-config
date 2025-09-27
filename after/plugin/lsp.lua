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

        if client:supports_method('textDocument/completion') then
            vim.cmd[[set completeopt+=menuone,noselect,popup]]
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})
