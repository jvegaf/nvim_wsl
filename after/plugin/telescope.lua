local status, builtin = pcall(require, "telescope.builtin")
if not status then return end

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files'})
vim.keymap.set('n', '<leader><Space>', builtin.git_files, { desc = 'Find Git files'})
vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = 'Find string'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags"})

