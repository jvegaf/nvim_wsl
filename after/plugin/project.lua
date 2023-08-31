local status, project_nvim = pcall(require, "project_nvim")
if not status then return end

project_nvim.setup({
  silent_chdir = false,
  session_autoload = true,

})

require('telescope').load_extension('projects')
