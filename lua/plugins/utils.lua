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
                "<leader>grep",
                function() require("telescope.builtin").live_grep({ search = "" }) end,
                mode = { "n" },
            },
            {
                "<leader>grep",
                function() require("telescope.builtin") end,
                mode = { "v" },
            },
            {
                "<leader>find",
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
    {
        "kana/vim-arpeggio",
        config = function()
            -- i'm being told that this is called "The Slam"
            vim.cmd([[
                Arpeggio inoremap jk <Esc>
                Arpeggio inoremap kj <Esc>
                Arpeggio vnoremap jk <Esc>
                Arpeggio vnoremap kj <Esc>
            ]])
        end
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "1.*",
        opts = {
            enabled = function()
                local disabled = { "markdown", "jinja", }
                if vim.tbl_contains(disabled, vim.bo.filetype) then
                    return false
                end

                return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
            end,
            keymap = { 
                preset = "enter",
                ['<C-y>'] = { "accept", "fallback" },
            },
            appearance = {
                highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            cmdline = {
                keymap = { preset = 'inherit' },
                completion = { menu = { auto_show = false } },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                documentation = {
                    treesitter_highlighting = true,
                    window = {
                        border = "single",
                    },
                },
                menu = {
                    border = "single",
                    draw = {
                        treesitter = { "lsp" },
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local icon = ctx.kind_icon

                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) and dev_icon then
                                        icon = dev_icon
                                    end

                                    return icon .. ctx.icon_gap
                                end,
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl

                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) and dev_icon then
                                        hl = dev_hl
                                    end

                                    return hl
                                end,
                            }
                        }
                    }
                }
            },
        },
        opts_extend = { "sources.default" },
    }
}
