-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jevf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jevf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jevf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jevf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jevf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["browse.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/browse.nvim",
    url = "https://github.com/jvegaf/browse.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.ai"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/mini.ai",
    url = "https://github.com/echasnovski/mini.ai"
  },
  ["mini.indentscope"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/mini.indentscope",
    url = "https://github.com/echasnovski/mini.indentscope"
  },
  ["mini.surround"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\a\freplace\bgsr\badd\bgsa\14highlight\bgsh\19update_n_lines\bgsn\14find_left\bgsF\tfind\bgsf\vdelete\bgsd\nsetup\18mini.surround\frequire\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/mini.surround",
    url = "https://github.com/echasnovski/mini.surround"
  },
  neotest = {
    config = { "\27LJ\2\n[\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0A\0\0\1K\0\1\0\6%\vexpand\afn\bvim\brun\fneotest\frequireT\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0006\2\3\0009\2\4\0029\2\5\2B\2\1\0A\0\0\1K\0\1\0\bcwd\tloop\bvim\brun\fneotest\frequire7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0B\0\1\1K\0\1\0\brun\fneotest\frequireB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\1K\0\1\0\vtoggle\fsummary\fneotest\frequireY\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\15auto_close\2\nenter\2\topen\voutput\fneotest\frequireG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\1K\0\1\0\vtoggle\17output_panel\fneotest\frequire�\4\1\0\a\0\28\1=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0?\4\0\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0003\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0003\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0003\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0003\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\3\tdesc\24Toggle Output Panel\fnoremap\2\vsilent\2\0\16<leader>too\1\0\3\tdesc\16Show Output\fnoremap\2\vsilent\2\0\15<leader>to\1\0\3\tdesc\19Toggle Summary\fnoremap\2\vsilent\2\0\15<leader>ts\1\0\3\tdesc\16Run Nearest\fnoremap\2\vsilent\2\0\15<leader>tr\1\0\3\tdesc\23Run All Test Files\fnoremap\2\vsilent\2\0\15<leader>tT\1\0\3\tdesc\rRun File\fnoremap\2\vsilent\2\0\15<leader>tt\6n\bset\vkeymap\bvim\radapters\1\0\0\19neotest-vitest\nsetup\fneotest\frequire\3����\4\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-vitest"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/neotest-vitest",
    url = "https://github.com/marilari88/neotest-vitest"
  },
  ["neovim-session-manager"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-file-operations"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lsp-file-operations\frequire\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-lsp-file-operations",
    url = "https://github.com/antosha417/nvim-lsp-file-operations"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\15\0\"6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0045\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\n\0045\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0006\4\5\0'\6\6\0B\4\2\0029\4\r\0045\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\25openFoldsExceptKinds\azr\1\0\2\fnoremap\2\vsilent\2\18closeAllFolds\azM\1\0\2\fnoremap\2\vsilent\2\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/coffebar/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/theprimeagen/refactoring.nvim"
  },
  ["statuscol.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\b\0\14\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0004\4\4\0005\5\6\0004\6\3\0009\a\5\0>\a\1\6=\6\a\5>\5\1\0045\5\t\0005\6\b\0=\6\a\5>\5\2\0045\5\f\0005\6\v\0009\a\n\0>\a\1\6=\6\a\5>\5\3\4=\4\r\3B\1\2\1K\0\1\0\rsegments\1\0\1\nclick\15v:lua.ScLa\1\3\0\0\0\6 \rlnumfunc\1\0\1\nclick\15v:lua.ScSa\1\2\0\0\a%s\ttext\1\0\1\nclick\15v:lua.ScFa\rfoldfunc\1\0\1\16relculright\2\nsetup\14statuscol\22statuscol.builtin\frequire\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/statuscol.nvim",
    url = "https://github.com/luukvbaal/statuscol.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["template-string.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20template-string\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/opt/template-string.nvim",
    url = "https://github.com/axelvc/template-string.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  treesj = {
    config = { "\27LJ\2\n�\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\23<cmd>TSJToggle<cr>\14<leader>j\6n\bset\vkeymap\bvim\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript-tools.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21typescript-tools\frequire\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/typescript-tools.nvim",
    url = "https://github.com/pmizio/typescript-tools.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-easy-align"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-pio"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/vim-pio",
    url = "https://github.com/normen/vim-pio"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\n-\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6;\14VM_leader\6g\bvim\0" },
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/jevf/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lsp-file-operations
time([[Config for nvim-lsp-file-operations]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lsp-file-operations\frequire\0", "config", "nvim-lsp-file-operations")
time([[Config for nvim-lsp-file-operations]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\15\0\"6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0045\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0006\4\5\0'\6\6\0B\4\2\0029\4\n\0045\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0006\4\5\0'\6\6\0B\4\2\0029\4\r\0045\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\25openFoldsExceptKinds\azr\1\0\2\fnoremap\2\vsilent\2\18closeAllFolds\azM\1\0\2\fnoremap\2\vsilent\2\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\bvim\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6;\14VM_leader\6g\bvim\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\23<cmd>TSJToggle<cr>\14<leader>j\6n\bset\vkeymap\bvim\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: mini.surround
time([[Config for mini.surround]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\a\freplace\bgsr\badd\bgsa\14highlight\bgsh\19update_n_lines\bgsn\14find_left\bgsF\tfind\bgsf\vdelete\bgsd\nsetup\18mini.surround\frequire\0", "config", "mini.surround")
time([[Config for mini.surround]], false)
-- Config for: statuscol.nvim
time([[Config for statuscol.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\b\0\14\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0004\4\4\0005\5\6\0004\6\3\0009\a\5\0>\a\1\6=\6\a\5>\5\1\0045\5\t\0005\6\b\0=\6\a\5>\5\2\0045\5\f\0005\6\v\0009\a\n\0>\a\1\6=\6\a\5>\5\3\4=\4\r\3B\1\2\1K\0\1\0\rsegments\1\0\1\nclick\15v:lua.ScLa\1\3\0\0\0\6 \rlnumfunc\1\0\1\nclick\15v:lua.ScSa\1\2\0\0\a%s\ttext\1\0\1\nclick\15v:lua.ScFa\rfoldfunc\1\0\1\16relculright\2\nsetup\14statuscol\22statuscol.builtin\frequire\0", "config", "statuscol.nvim")
time([[Config for statuscol.nvim]], false)
-- Config for: typescript-tools.nvim
time([[Config for typescript-tools.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21typescript-tools\frequire\0", "config", "typescript-tools.nvim")
time([[Config for typescript-tools.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n[\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0A\0\0\1K\0\1\0\6%\vexpand\afn\bvim\brun\fneotest\frequireT\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0006\2\3\0009\2\4\0029\2\5\2B\2\1\0A\0\0\1K\0\1\0\bcwd\tloop\bvim\brun\fneotest\frequire7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\2\0B\0\1\1K\0\1\0\brun\fneotest\frequireB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\1K\0\1\0\vtoggle\fsummary\fneotest\frequireY\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\15auto_close\2\nenter\2\topen\voutput\fneotest\frequireG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\1K\0\1\0\vtoggle\17output_panel\fneotest\frequire�\4\1\0\a\0\28\1=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0?\4\0\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0003\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0003\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0003\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0003\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\3\tdesc\24Toggle Output Panel\fnoremap\2\vsilent\2\0\16<leader>too\1\0\3\tdesc\16Show Output\fnoremap\2\vsilent\2\0\15<leader>to\1\0\3\tdesc\19Toggle Summary\fnoremap\2\vsilent\2\0\15<leader>ts\1\0\3\tdesc\16Run Nearest\fnoremap\2\vsilent\2\0\15<leader>tr\1\0\3\tdesc\23Run All Test Files\fnoremap\2\vsilent\2\0\15<leader>tT\1\0\3\tdesc\rRun File\fnoremap\2\vsilent\2\0\15<leader>tt\6n\bset\vkeymap\bvim\radapters\1\0\0\19neotest-vitest\nsetup\fneotest\frequire\3����\4\0", "config", "neotest")
time([[Config for neotest]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'template-string.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'template-string.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'template-string.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'template-string.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'template-string.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'vim-easy-align'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
