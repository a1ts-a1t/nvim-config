local nvim_tree = require('nvim-tree')
local api = require('nvim-tree.api')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

nvim_tree.setup({
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

vim.keymap.set('n', '<leader>touch', api.fs.create, {
    desc = 'nvim-tree: Create File Or Directory',
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true,
})

