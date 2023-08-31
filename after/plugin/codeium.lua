local status, codeium = pcall(require, "codeium")
if not status then return end


local cmp = require('cmp')

codeium.setup({})

cmp.setup({
  sources = {
    { name = "codeium", priority = 950 }
  }
})
