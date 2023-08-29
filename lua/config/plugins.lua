local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer_bootstrap = ensure_packer()

local use = require('packer').use

return require('packer').startup {
  function()
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "folke/tokyonight.nvim" }

    use {
      'rcarriga/nvim-notify',
    }


    use({
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          icons = false,
        }
      end
    })

    use {
      'axelvc/template-string.nvim',
      event = 'InsertEnter',
      ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      config = function()
        require('template-string').setup()
      end,
    }

    use 'moll/vim-bbye'

    use {
      'windwp/nvim-autopairs',
    }

    use {
      'junegunn/vim-easy-align',
      event = 'BufReadPost',
    }

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      }
    }

    use {
      'nvim-lualine/lualine.nvim',
    }

    use("arkav/lualine-lsp-progress")

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    use {
      'numToStr/Comment.nvim',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
    }

    use {
      'voldikss/vim-browser-search',
      config = function()
        vim.api.nvim_set_keymap('v', '<A-s>', ":'<,'>BrowserSearch<CR>", { noremap = true, silent = true })
      end
    }

    use 'windwp/nvim-spectre'

    use { 'normen/vim-pio' }

    use {
      'mg979/vim-visual-multi',
      config = function()
        vim.g.VM_leader = ';'
      end,
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
    }


    use {
      'kevinhwang91/nvim-ufo',
      requires = {
        'kevinhwang91/promise-async',
        {
          "luukvbaal/statuscol.nvim",
          config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
              relculright = true,
              segments = {
                { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                { text = { "%s" },                  click = "v:lua.ScSa" },
                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              },
            })
          end,
        }
      },
      config = function()
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, {silent=true, noremap=true})
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, {silent=true, noremap=true})
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, {silent=true, noremap=true})
      end,
    }

    use({
      'Wansmer/treesj',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('treesj').setup({ use_default_keymaps = false })
        vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>TSJToggle<cr>", {silent=true, noremap=true})
      end,
    })

    use {
      'goolord/alpha-nvim',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
    }

    use {
      'Shatur/neovim-session-manager',
      requires = 'nvim-lua/plenary.nvim',
    }

    use {
      "echasnovski/mini.surround",
      config = function()
        require("mini.surround").setup({
          mappings = {
            add = "gsa",
            delete = "gsd",
            find = "gsf",
            find_left = "gsF",
            highlight = "gsh",
            replace = "gsr",
            update_n_lines = "gsn",
          },
        })
      end
    }

    use {
      'folke/which-key.nvim',
    }

    use {
      'lalitmee/browse.nvim',
      requires = { 'nvim-telescope/telescope.nvim' },
    }
    ----------------------

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
    log = { level = 'info' },
  },
}
