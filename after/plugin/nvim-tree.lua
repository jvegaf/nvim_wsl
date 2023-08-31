local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup {
  -- disable_netrw = true,
  reload_on_bufenter = true,
  -- respect_buf_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_modifier = ":~",
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = false,
    },
  },
  -- tab = {
  --   sync = {
  --     open = true,
  --     close = true,
  --     ignore = {},
  --   },
  -- },
  modified = {
    enable = true,
  },
  view = {
    width = 40,
    side = "left",
    relativenumber = true,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}


vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
