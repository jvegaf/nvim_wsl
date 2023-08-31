local status, trouble = pcall(require, "trouble")
if not status then return end

trouble.setup {
  icons = false,
}

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
