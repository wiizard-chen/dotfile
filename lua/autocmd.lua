local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd
local vimcmd = vim.cmd

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = myAutoGroup,
  pattern = "*",
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - "o" -- O and o, don't continue comments
        + "r" -- But do continue when pressing enter.
  end,
})
vimcmd("packadd packer.nvim")

-- Undercurl
vimcmd([[let &t_Cs = "\e[4:3m"]])
vimcmd([[let &t_Ce = "\e[4:0m"]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vimcmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vimcmd ("set whichwrap+=<,>,[,],h,l")
vimcmd ([[set iskeyword+=-]])
vimcmd ([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

