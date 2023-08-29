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
  respect_buf_cwd = true,
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
    update_cwd = true,
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
  view = {
    width = 40,
    side = "left",
    -- float = {
    --   enable = true,
    --   open_win_config = function()
    --     local screen_w = vim.opt.columns:get()
    --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --     local window_w = screen_w * 0.5
    --     local window_h = screen_h * 0.8
    --     local window_w_int = math.floor(window_w)
    --     local window_h_int = math.floor(window_h)
    --     local center_x = (screen_w - window_w) / 2
    --     local center_y = ((vim.opt.lines:get() - window_h) / 2)
    --         - vim.opt.cmdheight:get()
    --     return {
    --       border = 'rounded',
    --       relative = 'editor',
    --       row = center_y,
    --       col = center_x,
    --       width = window_w_int,
    --       height = window_h_int,
    --     }
    --   end,
    -- },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}


vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {noremap=true, silent=true})
