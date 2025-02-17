require('lazy').setup({
  -- THEME
  'navarasu/onedark.nvim',

  -- STATUS LINE
  'nvim-lualine/lualine.nvim',

  "gennaro-tedesco/nvim-peekup",

  --Lspconfig
  'ckipp01/nvim-jenkinsfile-linter',
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
      },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',

      -- trouble
      'folke/trouble.nvim',
      'nvim-lua/lsp_extensions.nvim',
    },
  },

  -- auto-completion
  'onsails/lspkind-nvim', --VSCode-like Pictograms

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer'
    },
  },

  --LSP UI
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({})
  end,
  -- highlight
  'nvim-treesitter/nvim-treesitter',

  -- Autotag and Autopair
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',

  -- Fuzz finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'nvim-telescope/telescope-file-browser.nvim',
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },

  -- Tabs: Bufferline
  -- using packer.nvim
  {
    'akinsho/bufferline.nvim',
    branch = 'main',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  --Formatter: prettier and null-ls
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  --git
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>Lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  --Comments
  'numToStr/Comment.nvim',
  'tpope/vim',
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },

  -- highlight logs
  'MTDL9/vim-log-highlighting',

  --folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },

  --file-explorer
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  --harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  --snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
})

require('Comment').setup()
