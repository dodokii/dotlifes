-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g

-- disable nvim auto format on save
g.autoformat = false

-- Enable this option to avoid conflicts with Prettier.
g.lazyvim_prettier_needs_config = true

local opt = vim.opt

-- Enable folding by treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.swapfile = false
