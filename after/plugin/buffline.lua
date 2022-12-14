local status, bufferline = pcall(require, "bufferline")

if (status) then return end

-- if (not status) then return end

bufferline.setup({
  options = {
    -- 关闭 Thttps://github.com/Shatur/neovim-session-managerab 的命令
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 使用 nvim 内置 LSP  后续课程会配置
    diagnostics = "nvim_lsp",
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,

    mode = "buffers", -- set to "tabs" to only show tabpages instead

    separator_style = 'thin',

    always_show_bufferline = false,

    show_buffer_close_icons = false,

    show_close_icon = false,

    color_icons = true,

    numbers = 'ordinal',
  },
  highlights = {
    -- background = {
    --   italic = true,
    --   bg = '#073642'
    -- },
    info = {
      fg = 'yellow',
      bg = 'red'
    },
    buffer_selected = {
      bold = true,
      -- fg = 'black',
      -- bg = '#455668'
    },
  },
})
