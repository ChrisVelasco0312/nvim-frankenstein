
require('lazy').setup({

  -- THEME
  'navarasu/onedark.nvim',

  -- STATUS LINE
  'nvim-lualine/lualine.nvim',

  --Lspconfig

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  -- auto-completion
  'onsails/lspkind-nvim', --VSCode-like Pictograms

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer'
    },
  },

  --LSP UI
  'glepnir/lspsaga.nvim',
  -- highlight
  'nvim-treesitter/nvim-treesitter',

  -- Autotag and Autopair
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',

  -- Fuzz finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
    tag = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  --Formatter: prettier and null-ls
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  --git
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  --Comments
  'numToStr/Comment.nvim',
  'tpope/vim',

  --Dashboard
  'mhinz/vim-startify',

  --COPILOT
  'github/copilot.vim',

  --avoid neck pain
  { 'shortcuts/no-neck-pain.nvim' },

  -- conjure
  'Olical/conjure',
  'wlangstroth/vim-racket',
})

require('Comment').setup()
