----------- 自动加载 after 里面的所有文件夹 ---------------
require('base')

-- require('keybindings')

-- require('plugins')

-- require('colorschema')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
if is_mac then
  require('utils.macos')
end
if is_win then
  require('utils.windows')
end

-- print(vim.fn.stdpath('data'))
