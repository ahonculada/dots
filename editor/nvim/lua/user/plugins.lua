local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Automatically insert matching pairs of characters
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "github/copilot.vim" -- AI Pair programmer
  use 'kyazdani42/nvim-web-devicons' -- Web nvim-web-devicons
  use 'kyazdani42/nvim-tree.lua' -- Tree view for nvim
  use "akinsho/bufferline.nvim" -- Buffer line
  use "moll/vim-bbye" 
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"

  -- Color schemes
  use "lunarvim/darkplus.nvim"

  -- GUI
  use "lukas-reineke/indent-blankline.nvim" -- keep track of indentation 
  
  -- Git
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"

  -- Completions
  use "hrsh7th/nvim-cmp" -- Completion manager
  use "hrsh7th/cmp-buffer" -- Completion manager for buffers
  use "hrsh7th/cmp-path" -- Completion manager for paths
  use "hrsh7th/cmp-cmdline" -- Completion manager for commands
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" -- Completion manager for snippets
  use "onsails/lspkind-nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP 
  use "neovim/nvim-lspconfig" -- LSP support for neovim
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer 
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git 
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
