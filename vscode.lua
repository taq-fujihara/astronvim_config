local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup(
  {
    "folke/flash.nvim",
    version="*",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    lazy = false,
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
)

vim.keymap.set("n", "|", "<Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>")
vim.keymap.set("n", "-", "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>")
vim.keymap.set("n", "gt", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
vim.keymap.set("n", "gT", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>call VSCodeNotify('workbench.action.showAllEditors')<CR>")
vim.keymap.set("n", "<Leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
vim.keymap.set("n", "<Leader>o", "<Cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>")
vim.keymap.set("n", "<Leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")
vim.keymap.set("n", "<Leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set("n", "<Leader>n", "<Cmd>call VSCodeNotify('fileutils.newFileAtRoot')<CR>")
vim.keymap.set("n", "<Leader>/", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
vim.keymap.set("n", "<Leader>gt", "<Cmd>call VSCodeNotify('workbench.scm.focus')<CR>")
