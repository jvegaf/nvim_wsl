local status, barbar = pcall(require, "barbar")

if not status then
  return
end

barbar.setup({})
