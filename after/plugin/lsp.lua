vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = false;
            },
        },
    },
})

vim.lsp.config('ts_ls', {
    before_init = function(init_params, config)
        local root = config.root_dir
        if not root then
            return
        end

        -- guards against workspaces on TypeScript 7/ones using the tsgo compiler
        local old_tsserver = root .. '/node_modules/@typescript/old/lib/tsserver.js'
        if vim.uv.fs_stat(old_tsserver) then
            init_params.initializationOptions = init_params.initializationOptions or {}
            init_params.initializationOptions.tsserver = { path = old_tsserver }
        end
    end,
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
