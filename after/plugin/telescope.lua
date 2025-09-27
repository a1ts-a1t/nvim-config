local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ps', function()
    builtin.live_grep({ search = '' })
end, {})

vim.keymap.set('v', '<leader>ps', function()
   builtin.grep_string()
end, {})

vim.keymap.set('n', '<leader>pf', function()
    local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')

    if git_dir ~= '' then
        builtin.git_files({
            show_untracked = true
        })

        return
    end

    builtin.find_files()
end, {})

