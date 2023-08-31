local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup({
  options = {
    mode = "buffers",
    always_show_bufferline = true
  }
})
