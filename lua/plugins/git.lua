return {
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "esmuellert/codediff.nvim",
            "nvim-telescope/telescope.nvim",
            "m00qek/baleia.nvim",
        },
        cmd = "Neogit",
        opts = {
            graph_style = (function()
                local term = os.getenv("TERM")
                if term == "xterm-kitty" then
                    return "kitty"
                end

                return "ascii"
            end)()
        },
        keys = {
            { "<leader>git", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    }
}
