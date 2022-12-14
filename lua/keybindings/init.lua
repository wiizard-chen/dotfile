-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

require('keybindings.base')

local terminal = require("utils.terminal")

local utils = require("utils")

local map = utils.map

local builtin = require("telescope.builtin")

local status, wk = pcall(require, "which-key")

if (not status) then
  return print('no install whichKey')
end

wk.register({
  [','] = {
    w = {
      "*zz",
      "search word"
    },
    p = {
      "[{zz",
      "jump souround left bracket"
    },
    P = {
      "]}zz",
      "jump souround right bracket"
    },
    v = {
      "/<C-r>*<CR>",
      "search clipboard"
    },
    r = {
      ":nohl<CR> :edit<CR>",
      "refresh"
    },
  },
  s = {
    name = 'screen',
    s = { ':split<Return>', 'split screen' },
    v = { ':vsplit<Return>', 'vertical split screen' },
    h = { '<C-w>h', 'move h' },
    j = { '<C-w>j', 'move j' },
    k = { '<C-w>k', 'move k' },
    l = { '<C-w>l', 'move l' },
    ['='] = { '<C-w>=', 'resize equal' },
    c = { '<C-w>c', 'close cur screen' },
    o = { '<C-w>o', 'close other screen' },
    n = {
      '<cmd>BufferNext<CR>',
      'next buffer'
    },
    p = {
      '<cmd>BufferPrevious<CR>',
      'previous buffer'
    },
  },
  t = {
    name = "tab",
    c = { ':tabclose<CR>', 'close tab' },
    n = { ':tabnew<CR>', 'new tab' },
  },
  ['<leader>'] = {
    name = 'leader other',
    q = {
      q = { utils.smart_quit, "save all file and quit" },
      f = { ":sus<CR>", "switch vim to background, terminal input fg<CR> will back" },
    },
    b = {
      ":NvimTreeToggle<CR>",
      "open nvim tree"
    },
    w = {
      '<cmd>BufferDelete<CR>',
      "close buffer"
    },
    r = {
      ":edit<CR>",
      "refresh buffer",
    },
    n = {
      ":enew<CR>",
      "new buffer",
    },
    km = {
      ":Telescope keymaps<CR>",
      "show all keymaps",
    },
    f = {
      s = {
        ":wa!<CR>",
        "save all buffer"
      },
      f = {
        vim.lsp.buf.format,
        "format"
      },
    },
    v = {
      ['ws'] = {
        vim.lsp.buf.workspace_symbol,
        'work space symbol warning'
      },
      ['d'] = {
        vim.diagnostic.open_float,
        'diagnostic open float'
      },
      ['r'] = {
        vim.lsp.buf.references,
        'all references',
      },
      ['h'] = {
        vim.lsp.buf.signature_help,
        'sign help'
      }
    },
    t = {
      l = {
        '<cmd>TroubleToggle loclist<cr>',
        'show diagnostic list'
      },
      w = {
        '<cmd>TroubleToggle workspace_diagnostics<cr>',
        'show all workspace diagnostic',
      },
    },
    g = {
      name = 'git actions',
      l = {
        ':DiffviewFileHistory %<CR>',
        'file commit history',
      },
      c = {
        ':DiffviewClose<CR>',
        'file commit close',
      },
      o = {
        ':DiffviewOpen<CR>',
        'project commit history',
      },
      -- g = {
      --   terminal.lazygit_toggle,
      --   'toggle lazy_git'
      -- }
    },
    zz = {
      require("zen-mode").toggle,
      'zen mode'
    },
    s = {
      name = 'buffer opeartionf',
      c = {
        '<cmd>BufferCloseAllButCurrentOrPinned<CR>',
        'close all but cur and pinned'
      },
      C = {
        '<cmd>BufferCloseAllButCurrent<CR>',
        'close all but cur and pinned'
      },
      p = {
        '<cmd>BufferPin<CR>',
        'buffer pin'
      },
    },
  },
  ----------------------- lsp & git -------------------
  g = {
    name = 'lsp',
    d = {
      function()
        -- print(themes.get_dropdown())
        builtin.lsp_definitions()
        -- builtin.lsp_definitions(themes.get_dropdown())
        -- builtin.lsp_definitions({
        --   theme = "dropdown",
        --   file_ignore_patterns = {
        --     ".git/", "^node_modules/"
        --   }
        -- })
      end,
      'go to definition',
    },
    ['.'] = {
      '<Cmd>Lspsaga code_action<CR>',
      'code action'
    },
    p = {
      '<Cmd>Lspsaga lsp_finder<CR>',
      'all code info'
    },
    h = {
      '<Cmd>Lspsaga hover_doc<CR>',
      'lspsaga hover_doc',
    },
    o = {
      '<Cmd>Lspsaga outline<CR>',
      'open outline (amazing feature)'
    },
    l = {
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      'show current line diagnostics',
    },
    O = {
      ":TypescriptOrganizeImports<CR>",
      "Organize imports",
    }
    -- mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
    -- mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
    -- mapbuf("n", "go", ":TSLspOrganize<CR>", opt)
  },
  ------------------------------------------
  [";"] = {
    name = 'telescope',
    f = {
      function()
        builtin.git_files({
          no_ignore = false,
          hidden = true
        })
      end,
      'find file'
    },
    r = {
      function()
        builtin.grep_string({
          use_regex = false,
          grep_open_files = false,
          search = vim.fn.input("Grep > ")
        })
      end,
      'search all file'
    },
    h = {
      function()
        require("harpoon.ui").toggle_quick_menu();
      end,
      'harpoon ui'
    },
    a = {
      function()
        require("harpoon.mark").add_file();
      end,
      'harpoon add mark'
    },
    e = {
      function()
        builtin.resume()
      end,
      'telescope resume'
    },
    c = {
      function()
        utils.changed_on_branch()
      end,
      'telescope resume'
    },
    [';'] = {
      ';',
      'switch next word'
    }
  }
})

-- vim.diagnostic
map('n', '<F2>', vim.lsp.buf.rename)

-- ??????????????????????????????????????????????????????
map("n", "<F3>", [[:%s/\<<C-r>*\>/<C-r>*/g<Down>]])

map("n", "[e", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

map("n", "]e", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- ?????? lazygit ?????????
map("n", ";gg", terminal.lazygit_toggle)
