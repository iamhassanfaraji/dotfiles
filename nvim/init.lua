local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
	"sainnhe/everforest",
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.6',
      	        dependencies = { 'nvim-lua/plenary.nvim' }
   	},
})
require("remap")
require("plugins.telescope")
