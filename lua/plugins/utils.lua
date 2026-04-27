return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-web-devicons",
            "nvim-tree/nvim-web-devicons",
        },
        config = function () 
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
            })
        end,
        keys = {
            {
                "<leader>touch",
                function() require("nvim-tree.api").fs.create() end,
                mode = { "n" },
                desc = "Create File or Directory",
            }
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function() require("telescope") end,
        keys = {
            {
                "<leader>ps",
                function() require("telescope.builtin").live_grep({ search = "" }) end,
                mode = { "n" },
            },
            {
                "<leader>ps",
                function() require("telescope.builtin") end,
                mode = { "v" },
            },
            {
                "<leader>pf",
                function() 
                    local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')

                    if git_dir ~= '' then
                        require("telescope.builtin").git_files({
                            show_untracked = true
                        })

                        return
                    end

                    require("telescope.builtin").find_files()
                end,
                mode = { "n" },
            },
        },
    },
}
