local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorcheme not found!")
  return
end
