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

    use {
      "debugloop/telescope-undo.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
        require("telescope").setup({
          extensions = {
            undo = {
              side_by_side = true,
              layout_strategy = "vertical",
              layout_config = {
                preview_height = 0.8,
              },
            },
          },
        })
        require("telescope").load_extension("undo")
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "UndoTree" })
      end
    }

    use {
      "paopaol/telescope-git-diffs.nvim",
      requires = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
      config = function()
        require("telescope").load_extension("git_diffs")
      end

    }

    use {
      "lpoto/telescope-tasks.nvim",
      requires = {
        "nvim-telescope/telescope.nvim",
      },
      config = function()
        require("telescope").load_extension "tasks"
      end

    }

    use("RRethy/vim-illuminate")

    use { "folke/tokyonight.nvim" }

    use {
      'rcarriga/nvim-notify',
    }

    use {
      "jcdickinson/codeium.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
    }


    use("folke/trouble.nvim")

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
    use("nvim-treesitter/nvim-treesitter-context");

    use("echasnovski/mini.indentscope")
    use("echasnovski/mini.ai")

    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")

    use("dinhhuy258/git.nvim")
    use("lewis6991/gitsigns.nvim")
    use("akinsho/git-conflict.nvim")
    use("sindrets/diffview.nvim")

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
        { 'hrsh7th/cmp-emoji' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      }
    }

    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "arkav/lualine-lsp-progress"
      }
    }

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    use {
      'antosha417/nvim-lsp-file-operations',
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-tree.lua",
      },
      config = function()
        require("lsp-file-operations").setup()
      end
    }

    use {
      "pmizio/typescript-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("typescript-tools").setup {}
      end,
    }

    use {
      'numToStr/Comment.nvim',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
    }

    use('stevearc/dressing.nvim')

    use {
      'jvegaf/browse.nvim',
      requires = {
        'nvim-telescope/telescope.nvim',
      },
    }

    use {
      "coffebar/project.nvim",
      requires = {
        "nvim-telescope/telescope.nvim",
        "Shatur/neovim-session-manager",
      },
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
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { silent = true, noremap = true })
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { silent = true, noremap = true })
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { silent = true, noremap = true })
      end,
    }

    use({
      'Wansmer/treesj',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('treesj').setup({ use_default_keymaps = false })
        vim.keymap.set("n", "<leader>j", "<cmd>TSJToggle<cr>", { silent = true, noremap = true })
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

    use("akinsho/bufferline.nvim")

    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        'marilari88/neotest-vitest',
      },
      config = function()
        require('neotest').setup({
          adapters = {
            require('neotest-vitest')
          }
        })
      end
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
