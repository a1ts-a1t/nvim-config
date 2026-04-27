return {
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.o.background = 'light'
        end,
        config = function ()
            require("everforest").setup({
                background = "soft",
            })

            local ok, err = pcall(vim.cmd.colorscheme, "everforest")

            if not ok then
                vim.notify(
                    string.format("Failed to load color scheme, err: %s", err),
                    vim.log.levels.WARN
                )
                vim.cmd.colorscheme("default")
            end
        end,
    },
    {
        "romainl/vim-cool",
        lazy = false,
    }
}
