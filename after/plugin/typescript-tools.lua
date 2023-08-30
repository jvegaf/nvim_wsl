local status, typescript = pcall(require, "typescript-tools")
if not status then
  return
end

typescript.setup({
  on_attach = function()
    vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports" })
    vim.keymap.set("n", "<leader>cO", "<cmd>TSToolsSortImports<cr>", { desc = "Sort Imports" })
    vim.keymap.set("n", "<leader>cu", "<cmd>TSToolsRemoveUnused<cr>", { desc = "Removed Unused" })
    vim.keymap.set("n", "<leader>cz", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "Go To Source Definition" })
    vim.keymap.set("n", "<leader>cR", "<cmd>TSToolsRemoveUnusedImports<cr>", { desc = "Removed Unused Imports" })
    vim.keymap.set("n", "<leader>cF", "<cmd>TSToolsFixAll<cr>", { desc = "Fix All" })
    vim.keymap.set("n", "<leader>cA", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add Missing Imports" })
  end,
  -- handlers = { ... },
  settings = {
    tsserver_format_options = {},
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
    },
    complete_function_calls = true,
  },
})
