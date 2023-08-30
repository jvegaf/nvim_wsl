local status, indent = pcall(require, "mini.indentscope")
if not status then
  return
end


indent.setup({
  symbol = "│",
  options = {
    try_as_border = true
  }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "alpha",
    "dashboard",
    "nvim-tree",
    "Trouble",
    "packer",
    "mason",
    "notify",
    "toggleterm",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
