-- local colorscheme = "default"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("Colorscheme " .. colorscheme .. " not found!")
--   return
-- end
vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
