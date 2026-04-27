return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "main",
        config = function()
            local ensure_installed = { "lua", "vim", "javascript", "typescript", "python", "markdown" }
            require("nvim-treesitter.config").setup({
                ensure_installed = ensure_installed,
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })

            vim.api.nvim_create_autocmd('FileType', {
                pattern = ensure_installed,
                callback = function() vim.treesitter.start() end,
            })
        end
    }
}
