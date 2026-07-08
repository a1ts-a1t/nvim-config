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
            require("nvim-treesitter").install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = ensure_installed,
                callback = function() pcall(vim.treesitter.start) end,
            })
        end
    },
}
