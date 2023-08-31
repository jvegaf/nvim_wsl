local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    ['<leader>'] = 'SPC',
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'center', -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

local opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
  mode = 'n', -- NORMAL mode
  prefix = 'm',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
  a = { '<cmd>silent BookmarkAnnotate<cr>', 'Annotate' },
  -- c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  b = { '<cmd>silent BookmarkToggle<cr>', 'Toggle' },
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', 'Harpoon' },
  ['.'] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', 'Harpoon Next' },
  [','] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', 'Harpoon Prev' },
  l = { "<cmd>lua require('user.bfs').open()<cr>", 'Buffers' },
  j = { '<cmd>silent BookmarkNext<cr>', 'Next' },
  s = { '<cmd>Telescope harpoon marks<cr>', 'Search Files' },
  k = { '<cmd>silent BookmarkPrev<cr>', 'Prev' },
  S = { '<cmd>silent BookmarkShowAll<cr>', 'Prev' },
  -- s = {
  --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
  --   "Show",
  -- },
  x = { '<cmd>BookmarkClearAll<cr>', 'Clear All' },
  [';'] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', 'Harpoon UI' },
}

local mappings = {
  ['gy'] = 'Link',
  b = {
    name = 'Browse',
    i = { '<cmd>InputSearch<cr>', 'Input Search' },
    b = { '<cmd>Browse<cr>', 'Browse Menu' },
    d = { '<cmd>DevdocsSearch<cr>', 'Devdocs' },
    f = { '<cmd>DevdocsFiletypeSearch<cr>', 'Devdocs Filetype' },
    m = { '<cmd>MdnSearch<cr>', 'Mdn' },
  },
  p = {
    name = 'Packer',
    c = { '<cmd>PackerCompile<cr>', 'Compile' },
    i = { '<cmd>PackerInstall<cr>', 'Install' },
    s = { '<cmd>PackerSync<cr>', 'Sync' },
    S = { '<cmd>PackerStatus<cr>', 'Status' },
    u = { '<cmd>PackerUpdate<cr>', 'Update' },
  },
  o = {
    name = 'Options',
    c = { '<cmd>lua vim.g.cmp_active=false<cr>', 'Completion off' },
    C = { '<cmd>lua vim.g.cmp_active=true<cr>', 'Completion on' },
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', 'Wrap' },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', 'Relative' },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', 'Cursorline' },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', 'Spell' },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', 'Tabline' },
  },
  s = {
    name = 'System',
  },
  r = {
    name = 'Refactor',
    -- r = { "<cmd>lua require('spectre').open()<cr>", 'Replace' },
    -- w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", 'Replace Word' },
    -- f = { "<cmd>lua require('spectre').open_file_search()<cr>", 'Replace Buffer' },
  },
  d = {
    name = 'Debug',
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Breakpoint' },
    c = { "<cmd>lua require'dap'.continue()<cr>", 'Continue' },
    i = { "<cmd>lua require'dap'.step_into()<cr>", 'Into' },
    o = { "<cmd>lua require'dap'.step_over()<cr>", 'Over' },
    O = { "<cmd>lua require'dap'.step_out()<cr>", 'Out' },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Repl' },
    l = { "<cmd>lua require'dap'.run_last()<cr>", 'Last' },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", 'UI' },
    x = { "<cmd>lua require'dap'.terminate()<cr>", 'Exit' },
  },
  f = {
    name = 'Find',
    -- f = { '<cmd>Telescope find_files<cr>', 'Find files' },
    -- h = { '<cmd>Telescope help_tags<cr>', 'Help' },
    -- s = { '<cmd>Telescope grep_string<cr>', 'Find String' },
    C = { '<cmd>Telescope commands<cr>', 'Commands' },
    H = { '<cmd>Telescope highlights<cr>', 'Highlights' },
    M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
    R = { '<cmd>Telescope registers<cr>', 'Registers' },
    S = { '<cmd>lua require("luasnip.loaders").edit_snippet_files()<cr>', 'Find Snippets' },
    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", 'Colorscheme' },
    k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
    l = { '<cmd>Telescope resume<cr>', 'Last Search' },
    p = { '<cmd>Telescope projects<cr>', 'Projects' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Recent File' },
    t = { '<cmd>Telescope live_grep<cr>', 'Find Text' },
  },
  g = {
    name = 'Git',
    g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
    h = {
          name = "Hunk",
          j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
          p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
          r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
          s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
          u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", 'Undo Stage Hunk' },

    },
    l = { '<cmd>GitBlame<cr>', 'Blame' },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
    f = { '<cmd>DiffviewFileHistory %<cr>', 'File History' },
    s = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
    k = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
    z = { '<cmd>DiffviewOpen<cr>', 'Diff' },
    d = { '<cmd>Telescope git_diffs  diff_commits<cr>', 'Diff Commits'},
    c = { '<cmd>DiffViewClose<cr>', 'DiffView Close'},
    G = {
      name = 'Gist',
      a = { '<cmd>Gist -b -a<cr>', 'Create Anon' },
      d = { '<cmd>Gist -d<cr>', 'Delete' },
      f = { '<cmd>Gist -f<cr>', 'Fork' },
      g = { '<cmd>Gist -b<cr>', 'Create' },
      l = { '<cmd>Gist -l<cr>', 'List' },
      p = { '<cmd>Gist -b -p<cr>', 'Create Private' },
    },
  },
  l = {
    name = 'LSP',
    H = { '<cmd>IlluminationToggle<cr>', 'Toggle Doc HL' },
    I = { '<cmd>LspInstallInfo<cr>', 'Installer Info' },
    R = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
    S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Workspace Symbols' },
    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
    c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", 'Get Capabilities' },
    h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", 'Toggle Hints' },
    i = { '<cmd>LspInfo<cr>', 'Info' },
    j = { '<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>', 'Next Diagnostic' },
    k = { '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', 'Prev Diagnostic' },
    l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
    q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', 'Quickfix' },
    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
    t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', 'Toggle Diagnostics' },
    w = { '<cmd>Telescope lsp_workspace_diagnostics<cr>', 'Workspace Diagnostics' },
  },
  -- t = {
  --   name = 'Terminal',
  --   n = { '<cmd>lua _NODE_TOGGLE()<cr>', 'Node' },
  --   u = { '<cmd>lua _NCDU_TOGGLE()<cr>', 'NCDU' },
  --   t = { '<cmd>lua _HTOP_TOGGLE()<cr>', 'Htop' },
  --   p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' },
  -- },
  t = {
    name = 'Test',
    t = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', 'Run File' },
    T = { '<cmd>lua require("neotest").run.run(vim.loop.cwd())<cr>', 'Run All Tests' },
    r = { '<cmd>lua require("neotest").run.run()<cr>', 'Run Nearest' },
    s = { '<cmd>lua require("neotest").summary.toggle()<cr>', 'Summary' },
    o = { '<cmd>lua require("neotest").output.open({ enter = true, auto_close = true })<cr>', 'Show Output' },
    p = { '<cmd>lua require("neotest").output_panel.toggle()<cr>', 'Output Panel' },
  },
  T = {
    name = 'Treesitter',
    h = { '<cmd>TSHighlightCapturesUnderCursor<cr>', 'Highlight' },
    p = { '<cmd>TSPlaygroundToggle<cr>', 'Playground' },
    r = { '<cmd>TSToggle rainbow<cr>', 'Rainbow' },
  },
  z = {
    name = 'Tasks',
    z = { '<cmd>Telescope tasks<cr>', 'Tasks' },
    l = { '<cmd>lua require("telescope").extensions.tasks.actions.toggle_last_output()<cr>', 'Toggle Last Output' },
  },
}

local vopts = {
  mode = 'v', -- VISUAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ['/'] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', 'Comment' },
  S = { "<esc><cmd>'<,'>SnipRun<cr>", 'Run range' },
  s = { "<cmd>VisualSearch<cr>", 'Search in Google' },
  b = { "<cmd>VisualBookmarks<cr>", 'Search in Web' },
  h = { "<esc><cmd>'<,'>DiffviewFileHistory<cr>", 'Selected Git History' },
  -- z = { "<cmd>TZNarrow<cr>", "Narrow" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
